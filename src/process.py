import os
import cv2 as cv


def processer(original, saveas, process):

    if process == 'toGrey':
        result = cv.imread(original, 0)
    elif process == 'black':
        result = cv.imread(original, 0)

    cv.imwrite(saveas, result)


def file_processer(base, source, destination, process):
    types = {"Cow", "Sheep", "Goat", "Buff"}

    if os.path.isdir(os.path.join(base, destination)):
        print("Already exists: {}".format(destination))
        exit(1)

    os.mkdir(os.path.join(base, destination))
    for i in types:
        os.mkdir(os.path.join(base, destination, i))
        print('processing {}'.format(i))
        for filename in os.listdir(os.path.join(base, source, i)):
            processer(os.path.join(base, source, i, filename), os.path.join(base, destination, i, filename), process)


if __name__ == "__main__":
    save_as_folder = 'test'
    process = 'toGrey'

    file_processer('../images', 'raw', save_as_folder, process)
