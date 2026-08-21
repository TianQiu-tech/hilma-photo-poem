#!/usr/bin/env swift

import AppKit
import Foundation

struct Options {
    var photo = ""
    var abstract = ""
    var output = ""
    var line1 = ""
    var line2 = ""
    var photoMode = "fill"
    var photoAnchor = "center"
    var panelStyle = "framed"
    var cropBottom = 0.0
}

func fail(_ message: String) -> Never {
    FileHandle.standardError.write(Data(("Error: \(message)\n").utf8))
    exit(2)
}

func parseOptions() -> Options {
    var options = Options()
    let args = Array(CommandLine.arguments.dropFirst())
    var index = 0
    while index < args.count {
        let key = args[index]
        guard index + 1 < args.count else { fail("Missing value for \(key)") }
        let value = args[index + 1]
        switch key {
        case "--photo": options.photo = value
        case "--abstract": options.abstract = value
        case "--output": options.output = value
        case "--line1": options.line1 = value
        case "--line2": options.line2 = value
        case "--photo-mode": options.photoMode = value
        case "--photo-anchor": options.photoAnchor = value
        case "--panel-style": options.panelStyle = value
        case "--crop-bottom":
            guard let amount = Double(value), amount >= 0, amount < 0.6 else {
                fail("--crop-bottom must be between 0 and 0.59")
            }
            options.cropBottom = amount
        default: fail("Unknown option \(key)")
        }
        index += 2
    }
    guard !options.photo.isEmpty, !options.abstract.isEmpty, !options.output.isEmpty else {
        fail("Required: --photo PATH --abstract PATH --output PATH")
    }
    guard options.photoMode == "fit" || options.photoMode == "fill" else {
        fail("--photo-mode must be fit or fill")
    }
    guard ["top", "center", "bottom"].contains(options.photoAnchor) else {
        fail("--photo-anchor must be top, center, or bottom")
    }
    guard options.panelStyle == "framed" || options.panelStyle == "full" else {
        fail("--panel-style must be framed or full")
    }
    return options
}

func drawCroppedImage(_ image: NSImage, in target: NSRect, cropBottom: Double) {
    var source = NSRect(
        x: 0,
        y: image.size.height * cropBottom,
        width: image.size.width,
        height: image.size.height * (1 - cropBottom)
    )
    let targetAspect = target.width / target.height
    let sourceAspect = source.width / source.height
    if sourceAspect > targetAspect {
        let newWidth = source.height * targetAspect
        source.origin.x += (source.width - newWidth) / 2
        source.size.width = newWidth
    } else {
        let newHeight = source.width / targetAspect
        source.origin.y += (source.height - newHeight) / 2
        source.size.height = newHeight
    }
    image.draw(in: target, from: source, operation: .copy, fraction: 1.0)
}

func loadImage(_ path: String) -> NSImage {
    guard FileManager.default.fileExists(atPath: path) else { fail("File not found: \(path)") }
    guard let image = NSImage(contentsOfFile: path), image.size.width > 0, image.size.height > 0 else {
        fail("Cannot decode image: \(path)")
    }
    return image
}

func drawImage(_ image: NSImage, in target: NSRect, mode: String, anchor: String = "center") {
    let sx = target.width / image.size.width
    let sy = target.height / image.size.height
    let scale = mode == "fit" ? min(sx, sy) : max(sx, sy)
    let size = NSSize(width: image.size.width * scale, height: image.size.height * scale)
    let originY: CGFloat
    if mode == "fill" {
        switch anchor {
        case "top": originY = target.maxY - size.height
        case "bottom": originY = target.minY
        default: originY = target.midY - size.height / 2
        }
    } else {
        originY = target.midY - size.height / 2
    }
    let rect = NSRect(
        x: target.midX - size.width / 2,
        y: originY,
        width: size.width,
        height: size.height
    )
    NSGraphicsContext.saveGraphicsState()
    NSBezierPath(rect: target).addClip()
    image.draw(in: rect, from: NSRect(origin: .zero, size: image.size), operation: .copy, fraction: 1.0)
    NSGraphicsContext.restoreGraphicsState()
}

let options = parseOptions()
let photo = loadImage(options.photo)
let abstract = loadImage(options.abstract)

let canvasWidth = 1080
let canvasHeight = 1920
let abstractHeight = 810
let photoHeight = canvasHeight - abstractHeight
let outputScale = 2

guard let bitmap = NSBitmapImageRep(
    bitmapDataPlanes: nil,
    pixelsWide: canvasWidth * outputScale,
    pixelsHigh: canvasHeight * outputScale,
    bitsPerSample: 8,
    samplesPerPixel: 4,
    hasAlpha: true,
    isPlanar: false,
    colorSpaceName: .deviceRGB,
    bytesPerRow: 0,
    bitsPerPixel: 0
) else { fail("Cannot allocate output bitmap") }

guard let context = NSGraphicsContext(bitmapImageRep: bitmap) else { fail("Cannot create graphics context") }
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = context
context.cgContext.scaleBy(x: CGFloat(outputScale), y: CGFloat(outputScale))
context.imageInterpolation = .high

let canvas = NSRect(x: 0, y: 0, width: canvasWidth, height: canvasHeight)
NSColor(calibratedRed: 0.957, green: 0.933, blue: 0.863, alpha: 1).setFill()
canvas.fill()

let abstractRect = NSRect(x: 0, y: 0, width: canvasWidth, height: abstractHeight)
if options.panelStyle == "framed" {
    let wallColor = NSColor(calibratedRed: 0.89, green: 0.86, blue: 0.81, alpha: 1)
    wallColor.setFill()
    abstractRect.fill()

    let frameRect = NSRect(x: 220, y: 220, width: 640, height: 500)
    NSGraphicsContext.saveGraphicsState()
    let shadow = NSShadow()
    shadow.shadowColor = NSColor(calibratedWhite: 0.08, alpha: 0.22)
    shadow.shadowBlurRadius = 14
    shadow.shadowOffset = NSSize(width: 0, height: -6)
    shadow.set()
    NSColor(calibratedRed: 0.27, green: 0.20, blue: 0.15, alpha: 1).setFill()
    NSBezierPath(roundedRect: frameRect, xRadius: 2, yRadius: 2).fill()
    NSGraphicsContext.restoreGraphicsState()

    let matRect = frameRect.insetBy(dx: 18, dy: 18)
    NSColor(calibratedRed: 0.96, green: 0.94, blue: 0.89, alpha: 1).setFill()
    matRect.fill()

    let artworkRect = matRect.insetBy(dx: 22, dy: 22)
    drawCroppedImage(abstract, in: artworkRect, cropBottom: options.cropBottom)
} else {
    drawImage(abstract, in: abstractRect, mode: "fill")
}

let photoRect = NSRect(x: 0, y: abstractHeight, width: canvasWidth, height: photoHeight)
drawImage(photo, in: photoRect, mode: options.photoMode, anchor: options.photoAnchor)

if !options.line1.isEmpty || !options.line2.isEmpty {
    let poem = [options.line1, options.line2].filter { !$0.isEmpty }.joined(separator: "\n")
    let containsCJK = poem.unicodeScalars.contains { scalar in
        (0x3400...0x9FFF).contains(Int(scalar.value))
    }
    let preferredFont = containsCJK ? "Songti SC" : "New York"
    let font = NSFont(name: preferredFont, size: containsCJK ? 31 : 34)
        ?? NSFont(name: "Georgia", size: 34)
        ?? NSFont.systemFont(ofSize: 34, weight: .regular)
    let paragraph = NSMutableParagraphStyle()
    paragraph.alignment = options.panelStyle == "framed" ? .center : .left
    paragraph.lineSpacing = 7
    let mainAttributes: [NSAttributedString.Key: Any] = [
        .font: font,
        .foregroundColor: NSColor(calibratedRed: 0.16, green: 0.15, blue: 0.20, alpha: 0.92),
        .paragraphStyle: paragraph,
        .kern: containsCJK ? 2.0 : 1.2
    ]
    let attributed = NSMutableAttributedString(string: options.line1, attributes: mainAttributes)
    if !options.line2.isEmpty {
        let secondaryFont = NSFont(name: "New York Italic", size: containsCJK ? 27 : 27)
            ?? NSFont(name: "Georgia Italic", size: 27)
            ?? font
        let secondaryAttributes: [NSAttributedString.Key: Any] = [
            .font: secondaryFont,
            .foregroundColor: NSColor(calibratedRed: 0.22, green: 0.21, blue: 0.28, alpha: 0.88),
            .paragraphStyle: paragraph,
            .kern: containsCJK ? 1.6 : 0.8
        ]
        attributed.append(NSAttributedString(string: options.line1.isEmpty ? options.line2 : "\n\(options.line2)", attributes: secondaryAttributes))
    }
    let textRect = options.panelStyle == "framed"
        ? NSRect(x: 80, y: 43, width: 920, height: 126)
        : NSRect(x: 78, y: 24, width: 924, height: 128)
    attributed.draw(with: textRect, options: [.usesLineFragmentOrigin, .usesFontLeading])
}

context.flushGraphics()
NSGraphicsContext.restoreGraphicsState()

guard let png = bitmap.representation(using: .png, properties: [:]) else { fail("Cannot encode PNG") }
do {
    try png.write(to: URL(fileURLWithPath: options.output), options: .atomic)
} catch {
    fail("Cannot write output: \(error.localizedDescription)")
}

print(options.output)
