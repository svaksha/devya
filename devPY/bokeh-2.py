import cv2

def variance_of_laplacian(image):
    # compute the Laplacian of the image and then return the focus
    # measure, which is simply the variance of the Laplacian
    return cv2.Laplacian(image, cv2.CV_64F).var()

# loop over the input images
images = ["imgout_0013.png", "imgout_0014.png", "imgout_0015.png", "imgout_0016.png"]
for imagePath in images:
    image = cv2.imread(imagePath)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    fm = variance_of_laplacian(gray)
    print "image: %s  variance of laplacian: %s" % (imagePath, fm)
