import cv2


class SURFExtraction:
    def __int__(self, image):
        self.image = image

    def circle_keypoints(self):
        surf = cv2.xfeatures2d.SURF_create(400)
        kp, des = surf.detectAndCompute(self.image, None)
        print(len(kp))


# if __name__ == '__main__':
#     surf = SURFExtraction()
#     surf.image = cv2.imread('/Users/edwinjoseph/Projects/leather-species-identification/images/grey/Buff/Buff (1).jpg')
#
#     surf2 = SURFExtraction(
#         cv2.imread('/Users/edwinjoseph/Projects/leather-species-identification/images/grey/Buff/Buff (1).jpg'))

if __name__ == '__main__':
    surfer = SURFExtraction()
    surfer.image = cv2.imread('../images/grey/Buff/Buff (1).jpg')
    surfer.circle_keypoints()
