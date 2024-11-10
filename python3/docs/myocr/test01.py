import easyocr

reader = easyocr.Reader(["ko", "en"])
result = reader.readtext('./image.jpg', detail=0)

print(result)
