import easyocr

reader = easyocr.Reader(["ko", "en"])

result = reader.readtext('./data/55.jpg', detail=0)
print(result)