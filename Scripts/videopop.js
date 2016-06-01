// JavaScript Document
// Pop-Up Embedder Script by David Battino, www.batmosphere.com; Object tag implementation by Mark Levitt, http://digitalmedia.oreilly.com
var UniqueID = 314 // Make each link open in a new window.
var newWinOffset = 50 // Position of first pop-up
function PlayerOpen(soundfiledesc,soundfilepath, Contest,bCall) {


    PlayWin = window.open('Video/videopop.aspx' +
    '?PageTitle=' + soundfiledesc +
    '&filename=' + soundfilepath +
    '&Contest=' + Contest +
    '&bCall=' + bCall,
    UniqueID, 'width=1045px,height=820px,top=' + newWinOffset + ',left=40,resizable=1,scrollbars=1,titlebar=0,toolbar=0,menubar=0,status=0,directories=0,personalbar=0');

//1015/820
UniqueID = UniqueID + 1
newWinOffset = newWinOffset + 20 // subsequent pop-ups will be this many pixels lower.
}



function PlayerSmallOpen(soundfiledesc, soundfilepath, Contest, bCall) {
//    var Hi = 360;
//    if (navigator.userAgent.indexOf('Safari') != -1) {
//        Hi = 380;
//    }
    PlayWin = window.open('Video/videopop.aspx' +
    '?PageTitle=' + soundfiledesc +
    '&filename=' + soundfilepath +
    '&Contest=' + Contest +
    '&bCall=' + bCall,   
    UniqueID, 'width=340,height=360,top=' + newWinOffset + ',left=40,resizable=0,scrollbars=0,titlebar=0,toolbar=0,menubar=0,status=0,directories=0,personalbar=0');

UniqueID = UniqueID + 1
newWinOffset = newWinOffset + 20 // subsequent pop-ups will be this many pixels lower.
}

function PlayerFlashOpen(soundfiledesc, soundfilepath, Contest, bCall) {

    PlayWin = window.open('Video/Flash/videoflashpop.aspx' +
    '?PageTitle=' + soundfiledesc +
    '&filename=' + soundfilepath +
    '&Contest=' + Contest +
    '&bCall=' + bCall, UniqueID, 'width=1080px,height=840px,top=' + newWinOffset + ',left=40,resizable=1,scrollbars=1,titlebar=0,toolbar=0,menubar=0,status=0,directories=0,personalbar=0');

    //1054/800
UniqueID = UniqueID + 1
newWinOffset = newWinOffset + 20 // subsequent pop-ups will be this many pixels lower.
}