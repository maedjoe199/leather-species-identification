import cv2 as cv

print("Imported cv v"+cv.__version__)
path = '../images/raw/Buff/Buff (1).jpg'
img = cv.imread(path)

print("read")
cv.imshow('Buff1', img)

print("view")
cv.waitKey(60000)

print("end")
