################################################################################
# COPYRIGHT©2013-Now. @SVAKSHA <https://github.com/svaksha> AllRightsReserved.
# LICENSE: AGPLv3 and later <http://www.gnu.org/licenses/agpl.html>
# Include the Copyright notice and this permission notice in all copies.
################################################################################
## PROGRAM USECASE: Edge Detection, http://en.wikipedia.org/wiki/Edge_detection
##------------------------------------------------------------------------------

using Tk
using Images
using ImageView

function pratima()
    pix = imread("/home/jn/DAT/IMG-20170709-WA0001.jpg")

# The basic command to view the image is display. The optional pixelspacing
# input tells display that this image has a fixed aspect ratio, and that this
# needs to be honored when displaying the image.
# (Alternatively, you could set img["pixelspacing"] = [1,1] and then you
# wouldn't have to tell this to the display function.)
   # display(pix, pixelspacing = [1,1])
    display(pix)
end

pix = imread()
imgc, imgslice = display(pix);

#If we are not in a REPL
if (!isinteractive())

    # Create a condition object
    c = Condition()

    # Get the main window (A Tk toplevel object)
    win = toplevel(imgc)

    # Notify the condition object when the window closes
    bind(win, "<Destroy>", e->notify(c))

    # Wait for the notification before proceeding ...
    wait(c)
end


##function greyscale2Float()
##    """
##    Converting the greyscale image into a floating type. Shades of gray are
##    coded as unsigned one-byte integer values with 0 corresponding to black
##    and 255 corresponding to white.
##    """
##    bitmap = np.array(convertgf, dtype=float)
##    df = bitmap / 255      # converts my image to floating types between 0 to 1 (df /= 255)
##    print(df)
##    return df
##end
##
##function diagonal_matrix(df, dist=5):
##    """
##    The distance can be increased or decreased for finer or coarser edge
##    detection.
##    """
##    tLbR = abs(np.subtract(df[0:-dist,0:-dist] , df[dist:,dist:]))
##    print("tLbR", tLbR)
##    print(np.median(tLbR, 1))   # print median
##    bLtR = abs(np.subtract(df[0:-dist,dist:] , df[dist:,0:-dist]))
##    print("bLtR", bLtR)
##    diaDD = tLbR + bLtR
##    return diaDD
##end

