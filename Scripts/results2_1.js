var _updateProgressDiv;
var _btnGrid;
var _Puce;
var _GridView1;
var wwchk;
var wpxchk;
var CatSchk;
var CatAchk;
var _btnGVCall;
var _btnGVTest;
var _btnSwitch;
var _btnVar;
var _btnCall;
var __btnSessionCall;
var _DDLCty;
var _TB;
var ScrollTop;

function pageLoad(sender, args) {
    //  register for our events
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);
    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
    //            Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(pageLoaded);
    _updateProgressDiv = $get('updateProgressDiv');
    _btnGrid = $get('btnGrid');
    _GridView1 = $get('GridView1');
    _btnSwitch = $get('btnSwitch');
    _btnVar = $get('btnVar');
    _btnSessionCall = $get('btnSessionCall');
    _btnGVCall = $get('btnGVCall');
    _btnGVClass = $get('btnGVClass');
    _btnGVTest = $get('btnGVTest');
    _btnCall = $get('btnCall');           //save checks
    _chktbl = $get('testCheckBoxListCol1');
    _DDLCty = $get('DDLCty');
    _TB = $get('Calltxtbox');

    chkBoxArray = _chktbl.getElementsByTagName("input");
    wwchk = new Array(chkBoxArray.length);
    for (i = 0; i < chkBoxArray.length; i++) {
        wwchk[i] = chkBoxArray[i].checked;
    }

    _chktbl = $get('testCheckBoxListCol2');
    if (_chktbl != null) {
        chkBoxArray = _chktbl.getElementsByTagName("input");
        wpxchk = new Array(chkBoxArray.length);
        for (i = 0; i < chkBoxArray.length; i++) {
            wpxchk[i] = chkBoxArray[i].checked;
        }
    }
    _chktbl = $get('CheckBoxListCatS');
    chkBoxArray = _chktbl.getElementsByTagName("input");
    CatSchk = new Array(chkBoxArray.length);
    for (i = 0; i < chkBoxArray.length; i++) {
        CatSchk[i] = chkBoxArray[i].checked;
    }
    _chktbl = $get('CheckBoxListCatA');
    chkBoxArray = _chktbl.getElementsByTagName("input");
    CatAchk = new Array(chkBoxArray.length);
    for (i = 0; i < chkBoxArray.length; i++) {
        CatAchk[i] = chkBoxArray[i].checked;
    }
    //            Sys.UI.DomElement.setLocation(_updateProgressDiv, 450, 400);
    //            if (!Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack()) {
    //                _updateProgressDiv.style.display = '';
    //                __doPostBack(_btnGrid.name, '');
    //            }
    if (_TB.value.length > 1 && _TB.value != "") {
        _DDLCty.disabled = true;
        $get('CtyDef').disabled = true;
    } else {
        _DDLCty.disabled = false;
        $get('CtyDef').disabled = false;
    }

    if (document.body.addEventListener) {
        document.body.addEventListener('click', ClearUnsavedChecks, false);
    } else if (document.body.attachEvent) {
        document.body.attachEvent('onclick', ClearUnsavedChecks); 
    } 
}
function ClearUnsavedChecks() {
    _chktbl = $get('testCheckBoxListCol1');
    if (_chktbl != null) {
        chkBoxArray = _chktbl.getElementsByTagName("input");
        for (j = 0; j < chkBoxArray.length; j++) {
            chkBoxArray[j].checked = wwchk[j];
        }
    }
    _chktbl = $get('testCheckBoxListCol2');
    if (_chktbl != null) {
        chkBoxArray = _chktbl.getElementsByTagName("input");
        for (j = 0; j < chkBoxArray.length; j++) {
            chkBoxArray[j].checked = wpxchk[j];
        }
    }
    _chktbl = $get('CheckBoxListCatA');
    if (_chktbl != null) {
        chkBoxArray = _chktbl.getElementsByTagName("input");
        for (j = 0; j < chkBoxArray.length; j++) {
            chkBoxArray[j].checked = CatAchk[j];
        }
    }
    _chktbl = $get('CheckBoxListCatS');
    if (_chktbl != null) {
        chkBoxArray = _chktbl.getElementsByTagName("input");
        for (j = 0; j < chkBoxArray.length; j++) {
            chkBoxArray[j].checked = CatSchk[j];
        }
    }

}

function beginRequest(Obj) {
    // make it visible
    _updateProgressDiv.style.display = '';
    //	set the progress element to this position
    Sys.UI.DomElement.setLocation(_updateProgressDiv, 0x220, 0x1c0);
}



function MybeginRequest(Obj) {
    // make it visible
    _updateProgressDiv.style.display = '';
    // get the bounds of both the gridview and the progress div
    var tabContainerwBounds = Sys.UI.DomElement.getBounds(Obj);
    var updateProgressDivBounds = Sys.UI.DomElement.getBounds(_updateProgressDiv);

    //  center of gridview
    var x = tabContainerwBounds.x + Math.round(tabContainerwBounds.width / 2) - Math.round(updateProgressDivBounds.width / 2);
    var y = tabContainerwBounds.y + Math.round(tabContainerwBounds.height / 2) - Math.round(updateProgressDivBounds.height / 2);


    //            ScrollTop = document.body.scrollTop;
    //
    //            if (ScrollTop == 0) {
    //                if (window.pageYOffset)
    //                    ScrollTop = window.pageYOffset;
    //                else
    //                    ScrollTop = (document.body.parentElement) ? document.body.parentElement.scrollTop : 0;
    //            }


    //	set the progress element to this position
    Sys.UI.DomElement.setLocation(_updateProgressDiv, x, y);
}

//        function PageLoaded(sender, args) {
//            // make it invisible
//            Sys.UI.DomElement.setLocation(_updateProgressDiv, 450, 400);
//            if (!Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack()) {
//                _updateProgressDiv.style.display = '';
//                __doPostBack(_btnGrid.name, '');
//            }

//        }

function endRequest(sender, args) {
    if (args.get_error() && args.get_error().name == 'Sys.WebForms.PageRequestManagerTimeoutException') {
        args.set_errorHandled(true);
    }
    if (args.get_error() && args.get_error().name == 'Sys.WebForms.PageRequestManagerServerErrorException') {
        args.set_errorHandled(true);
    }
    if (args.get_error() && args.get_error().name == 'Sys.WebForms.PageRequestManagerParserErrorException') {
        args.set_errorHandled(true);
    }
    // make it invisible
    _updateProgressDiv.style.display = 'none';

    //            if (window.pageYOffset)
    //                window.pageYOffset = ScrollTop;
    //            else if (document.body.parentElement)
    //                document.body.parentElement.scrollTop = ScrollTop;
}


function cT(type, puname, Action, btn) {
    var Puce = $find(puname);
    found = false;
    if (Action == 'OK') {
        switch (type) {
            case 1:
                var _chktbl = $get('testCheckBoxListCol1');
                chkBoxArray = _chktbl.getElementsByTagName("input");
                for (j = 0; j < chkBoxArray.length; j++) {
                    if (chkBoxArray[j].checked == true) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    _chktbl = $get('testCheckBoxListCol2');
                    if (_chktbl != null) {
                        chkBoxArray = _chktbl.getElementsByTagName("input");
                        for (j = 0; j < chkBoxArray.length; j++) {
                            if (chkBoxArray[j].checked == true) {
                                found = true;
                                break;
                            }
                        }
                    }
                }
                break;
            case 2:
                _chktbl = $get('CheckBoxListCatA');
                chkBoxArray = _chktbl.getElementsByTagName("input");
                for (j = 0; j < chkBoxArray.length; j++) {
                    if (chkBoxArray[j].checked == true) {
                        found = true;
                        break;
                    }
                }
                if (!found) {
                    _chktbl = $get('CheckBoxListCatS');
                    if (_chktbl != null) {
                        chkBoxArray = _chktbl.getElementsByTagName("input");
                        for (j = 0; j < chkBoxArray.length; j++) {
                            if (chkBoxArray[j].checked == true) {
                                found = true;
                                break;
                            }
                        }
                    }
                }
                break;
            default:
                break;
        }
        if (found) {
            Puce.hidePopup();
            var _btn = $get(btn);
            __doPostBack(_btn.name, '');
            //                     if (_GridView1 != null )
            //                         MybeginRequest(_GridView1);
        } else {
            alert("You must select at least one item");
        }
    } else {
        switch (type) {
            case 1:
                _chktbl = $get('testCheckBoxListCol1');
                chkBoxArray = _chktbl.getElementsByTagName("input");
                for (j = 0; j < chkBoxArray.length; j++) {
                    chkBoxArray[j].checked = wwchk[j];
                }
                _chktbl = $get('testCheckBoxListCol2');
                if (_chktbl != null) {
                    chkBoxArray = _chktbl.getElementsByTagName("input");
                    for (j = 0; j < chkBoxArray.length; j++) {
                        chkBoxArray[j].checked = wpxchk[j];
                    }
                }
            case 2:
                _chktbl = $get('CheckBoxListCatA');
                chkBoxArray = _chktbl.getElementsByTagName("input");
                for (j = 0; j < chkBoxArray.length; j++) {
                    chkBoxArray[j].checked = CatAchk[j];
                }
                _chktbl = $get('CheckBoxListCatS');
                chkBoxArray = _chktbl.getElementsByTagName("input");
                for (j = 0; j < chkBoxArray.length; j++) {
                    chkBoxArray[j].checked = CatSchk[j];
                }
            default:
                break;
        }

        Puce.hidePopup();
    }
}

function checkedChanged(obj, btn) {
    _chktbl = $get(obj);
    _btnSwitch.value = _chktbl.id.toString();
    chkBoxArray = _chktbl.getElementsByTagName("input");
    found = false;
    for (j = 0; j < chkBoxArray.length; j++) {
        if (chkBoxArray[j].checked) {
            found = true;
        }
    }
    if (found) {
        __doPostBack(btn.name, '');
        //                 if (_GridView1 != null)
        //                     MybeginRequest(_GridView1);
    }
}

function DDLChanged(obj) {
    _chktbl = $get(obj);
    _btnSwitch.value = _chktbl.id.toString();
    __doPostBack(_btnGrid.name, '');
    //             if (_GridView1 != null)
    //                 MybeginRequest(_GridView1);
}

function CallClr_C(obj) {
    _obj = $get(obj);
    _obj.value = "";
    _btnSwitch.value = obj;
    __doPostBack(_btnCall.name, '');
    //             if (_GridView1 != null)
    //                 MybeginRequest(_GridView1);
}

function CtyDef_C(obj) {
    _obj = $get(obj);
    _obj.value = "All Countries";
    _btnSwitch.value = obj;
    __doPostBack(_btnGrid.name, '');
    //             if (_GridView1 != null)
    //                 MybeginRequest(_GridView1);
}


function CBPwrChanged(obj, btn) {
    _btnSwitch.value = obj.id.toString();
    _chktbl = $get('CheckBoxLisPwr');
    chkBoxArray = _chktbl.getElementsByTagName("input");
    if (obj.checked == true) {
        for (j = 0; j < chkBoxArray.length; j++) {
            chkBoxArray[j].disabled = true;
        }
    } else {
        for (j = 0; j < chkBoxArray.length; j++) {
            chkBoxArray[j].disabled = false;
        }
    }
    found = false;
    for (j = 0; j < chkBoxArray.length; j++) {
        if (chkBoxArray[j].checked) {
            found = true;
        }
    }
    if (found) {
        __doPostBack(btn.name, '');
        //                 if (_GridView1 != null)
        //                     MybeginRequest(_GridView1);
    }
}

function callChanged(obj, event) {
    k = event.keyCode;
    //               alert(k);
    var done = false;
    if (k == 0xd) {
        done = true;
    } else if (k == 0x8 || k == 37) {
        if (obj.value.length) {
            obj.value = obj.value.substr(0, obj.value.length - 1);
            done = true;
        }
    } else if ((k >= 47 && k <= 57) ||
                    (k >= 97 && k <= 122) ||
                    (k >= 65 && k <= 90)) {
        obj.value += String.fromCharCode(k).toUpperCase();
    }
    else if (k == 46) {
        var tC = document.getElementById('Calltxtbox');
        var startPos = tC.selectionStart;
        var endPos = tC.selectionEnd;
        selectedText = tC.value.substring(startPos, endPos);
        tC.value = tC.value.replace(selectedText, "");
    }
    else if (k == 9) {
        return true;
    }

    if (obj.value.length > 1) {
        done = true;
    }
    if (done) {
        __doPostBack(_btnCall.name, '');
        //                 if (_GridView1 != null)
        //                     MybeginRequest(_GridView1);
    }
}

//var pEx;
//         function LogCallClicked(obj, Call, ContestID) {
//pEx = obj;
function LogCallClicked(Call, ContestID,EntryClass) {
    _btnSwitch.value = Call;
    _btnVar.value = ContestID;
    var Label = $get("NewLblCall");
    if (Label) Label.innerHTML = Call;
    Label = $get("NewLblClass");
    if (Label) Label.innerHTML = EntryClass;
    _btnGVCall.value = Call;
    _btnGVClass.value = EntryClass;
    _btnGVTest.value = ContestID;
    Label = $get("NewLblTestID");
    if (Label) Label.innerHTML = ContestID;
    Label = $get("BtnAddCall1");
    if (Label) Label.value = "Call1: " + Call;
    Label = $get("BtnAddCall2");
    if (Label) Label.value = "Call2: " + Call;
    Label = $get("BtnAddCall3");
    if (Label) Label.value = "Call3: " + Call;


    var popup = $find("PuceAddCall");
    if (popup) popup.showPopup();


}

function UpdateSesion(action, Graph, rb) {
    var popup;
    if (action == 'OK') {
        _btnSwitch.value = Graph;
        _btnVar.value = rb.toString();
        __doPostBack(_btnSessionCall.name, '');
        //                 if (_GridView1 != null)
        //                     MybeginRequest(_GridView1);
        //                 popup = $find(pEx);
        popup = $find("PuceAddCall");
        if (popup) popup.hidePopup();

    } else {
        popup = $find("PuceAddCall");
        if (popup) popup.hidePopup();
    }
}

function PagerKey(key) {
    _btnSwitch.value = key;
    if (key == 'ddlPageSelector') {
        obj = $get("ddlPageSelector");
        _btnVar.value = obj.selectedIndex;
    }

    __doPostBack(_btnGrid.name, '');
    //            gv = $get('<%= GridView1.ClientID %>');

    //            if (gv != null)
    //                MybeginRequest(gv);
}

