<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="ContestViewer.test" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Results.css" rel="stylesheet" type="text/css" id="cssRes" />

    <script type="text/javascript" language="javascript">

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
            if (_TB.value.length > 1 && _TB.value != "") {
                _DDLCty.disabled = true;
                $get('CtyDef').disabled = true;
            } else {
                _DDLCty.disabled = false;
                $get('CtyDef').disabled = false;
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


        function endRequest(sender, args) {
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
//                    if (_GridView1 != null)
//                        MybeginRequest(_GridView1);
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
//                if (_GridView1 != null)
//                    MybeginRequest(_GridView1);
            }
        }

        function DDLChanged(obj) {
            _chktbl = $get(obj);
            _btnSwitch.value = _chktbl.id.toString();
            __doPostBack(_btnGrid.name, '');
//            if (_GridView1 != null)
//                MybeginRequest(_GridView1);
        }

        function CallClr_C(obj) {
            _obj = $get(obj);
            _obj.value = "";
            _btnSwitch.value = obj;
            __doPostBack(_btnCall.name, '');
//            if (_GridView1 != null)
//                MybeginRequest(_GridView1);
        }

        function CtyDef_C(obj) {
            _obj = $get(obj);
            _obj.value = "All Countries";
            _btnSwitch.value = obj;
            __doPostBack(_btnGrid.name, '');
//            if (_GridView1 != null)
//                MybeginRequest(_GridView1);
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
//                if (_GridView1 != null)
//                    MybeginRequest(_GridView1);
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
        function LogCallClicked(Call, ContestID) {
            _btnSwitch.value = Call;
            _btnVar.value = ContestID;
            var Label = $get("NewLblCall");
            if (Label) Label.innerHTML = Call;
            _btnGVCall.value = Call;
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
//                if (_GridView1 != null)
//                    MybeginRequest(_GridView1);
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

       
    </script>

  
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MC" runat="server">
    <div style="margin-left: -6pt; margin-top: 3px;"  >
    <asp:UpdatePanel ID="UpdatePanelBtn" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <input id="btnCall" runat="server" type="button" style="display: none" onserverclick="Call_changed"
                clientidmode="Static" />
            <input id="btnSessionCall" runat="server" type="button" style="display: none" onserverclick="SessionCall_changed"
                clientidmode="Static" />
            <input id="btnCon" runat="server" type="button" style="display: none" onserverclick="Contest_changed"
                clientidmode="Static" />
           <input id="btnCat" runat="server" type="button" style="display: none" onserverclick="Cat_changed"
                clientidmode="Static" />
            <input id="btnChk" runat="server" type="button" style="display: none" onserverclick="Check_changed"
                clientidmode="Static" />
            <input id="btnGrid" runat="server" type="button" style="display: none" onserverclick="Grid_changed"
                clientidmode="Static" />
            <input id="btnGVCall" runat="server" type="text" style="display: none" clientidmode="Static" />
            <input id="btnGVTest" runat="server" type="text" style="display: none" clientidmode="Static" />
            <input id="btnSwitch" runat="server" type="text" style="display: none" clientidmode="Static" />
            <input id="btnVar" runat="server" type="text" style="display: none" clientidmode="Static" />
        </ContentTemplate>
    </asp:UpdatePanel>
 
 
    <asp:Panel ID="ResultsPanel" runat="server" Width="994px" CssClass="ResultsPanel">
        <table>
            <tr>
                <td align="left" style="padding-left: 0px;">
                    <asp:UpdatePanel ID="UpdatePanelContests" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="ContestsPanel" runat="server" CssClass="Grpbox" Width="370px" Height="115px">
                                <table style="margin-top: 1px;">
                                    <tr align="left">
                                        <td colspan="2" valign="top">
                                            <asp:Label ID="Label1" runat="server" CssClass="GrpboxTitle" Text="Contests"></asp:Label>
                                            <span style="padding-left: 50px">
                                                <asp:Button ID="SelContestsButton" runat="server" Font-Size="8pt" Text="Select Contests"
                                                    Width="150" OnClientClick="return false;" SkinID="butSkin" />
                                            </span>
                                        </td>
                                        <td>
                                            <asp:PopupControlExtender ID="PuceContests" runat="server" PopupControlID="Panel2"
                                                TargetControlID="SelContestsButton" OffsetX="-240" Position="Right" ClientIDMode="Static"
                                                BehaviorID="PcB" />
                                            <asp:Panel ID="Panel2" runat="server" CssClass="popupControl" Width="285px" BackColor="White">
                                                <table>
                                                    <tr align="left">
                                                        <td valign="top">
                                                            <asp:CheckBoxList ID="testCheckBoxListCol1" runat="server" Font-Bold="False" ForeColor="Black"
                                                                Font-Size="8pt" ClientIDMode="Static">
                                                            </asp:CheckBoxList>
                                                        </td>
                                                        <td valign="top">
                                                            <asp:CheckBoxList ID="testCheckBoxListCol2" runat="server" ForeColor="Black" Font-Size="8pt"
                                                                ClientIDMode="Static">
                                                            </asp:CheckBoxList>
                                                        </td>
                                                    </tr>
                                                    <tr align="right">
                                                        <td>
                                                            <asp:Button ID="ButtonOK" runat="server" Text="OK" OnClientClick="cT(1,'PcB','OK','btnCon');return false;"
                                                                SkinID="butSkin" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClientClick="cT(1,'PcB','Can','btnCon');return false;"
                                                                SkinID="butSkin" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td style="border: 1px solid #000000; width: 180px; height: 78px;" align="left" valign="top">
                                            <asp:Label ID="Label3" runat="server" CssClass="ContestLabelTitle" Text="CQWWSSB"></asp:Label>
                                            <br />
                                            <asp:Label ID="cqwwSsbLbl" runat="server" CssClass="ContestLabels"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label5" runat="server" CssClass="ContestLabelTitle" Text="CQWWCW"></asp:Label>
                                            <br />
                                            <asp:Label ID="cqwwCwLbl" runat="server" CssClass="ContestLabels"></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #000000; width: 180px;" valign="top">
                                            <asp:Label ID="Label7" runat="server" CssClass="ContestLabelTitle" Text="CQWPXSSB"></asp:Label>
                                            <br />
                                            <asp:Label ID="cqwpxSsbLbl" runat="server" CssClass="ContestLabels">
                                            </asp:Label>
                                            <br />
                                            <asp:Label ID="Label9" runat="server" CssClass="ContestLabelTitle" Text="CQWPXCW"></asp:Label>
                                            <br />
                                            <asp:Label ID="cqwpxCwLbl" runat="server" CssClass="ContestLabels"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="RCECon" runat="server" TargetControlID="ContestsPanel"
                                BorderColor="Black" Enabled="True" Radius="5">
                            </asp:RoundedCornersExtender>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnCon" EventName="ServerClick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td align="left" style="padding-left: 2px;">
                    <asp:UpdatePanel ID="UpdatePanelCat" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="CatPanel" runat="server" CssClass="Grpbox" Width="180px" Height="115px">
                                <table style="width: 175px; margin-top: 1px;">
                                    <tr align="left">
                                        <td>
                                            <asp:Label ID="Label2" runat="server" CssClass="GrpboxTitle" Text="Entry Class"></asp:Label>
                                            <span style="padding-left: 7px">
                                                <asp:Button ID="SelectCat" runat="server" Font-Size="8pt" Text="Select" TabIndex="2"
                                                    OnClientClick="return false;" SkinID="butSkin" />
                                            </span>
                                            <asp:PopupControlExtender ID="PopupControlExtender1" runat="server" PopupControlID="Panel4"
                                                TargetControlID="SelectCat" OffsetX="-120" Position="Right" ClientIDMode="Static"
                                                BehaviorID="PcatB" />
                                            <asp:Panel ID="Panel4" runat="server" CssClass="popupControl" Width="185px" BackColor="White">
                                                <table>
                                                    <tr align="left">
                                                        <td valign="top">
                                                            <asp:CheckBoxList ID="CheckBoxListCatA" runat="server" Font-Bold="False" ForeColor="Black"
                                                                Font-Size="8pt" ClientIDMode="Static">
                                                            </asp:CheckBoxList>
                                                        </td>
                                                        <td valign="top">
                                                            <asp:CheckBoxList ID="CheckBoxListCatS" runat="server" ForeColor="Black" Font-Size="8pt"
                                                                ClientIDMode="Static">
                                                            </asp:CheckBoxList>
                                                        </td>
                                                    </tr>
                                                    <tr align="right">
                                                        <td>
                                                            <asp:Button ID="Button2" runat="server" Text="OK" OnClientClick="cT(2,'PcatB','OK','btnCat');return false;"
                                                                SkinID="butSkin" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="Button3" runat="server" Text="Cancel" OnClientClick="cT(2,'PcatB','Can','btnCat');return false;"
                                                                SkinID="butSkin" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td style="border: 1px solid #000000; height: 78px;" align="left" valign="top">
                                            <asp:Label ID="Label6" runat="server" CssClass="ContestLabelTitle" Text="ALL BAND"></asp:Label>
                                            <br />
                                            <asp:Label ID="CatAllLbl" runat="server" CssClass="ContestLabels"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label8" runat="server" CssClass="ContestLabelTitle" Text="SINGLE BAND"></asp:Label>
                                            <br />
                                            <asp:Label ID="CatSingleLbl" runat="server" CssClass="ContestLabels"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="RCECat" runat="server" TargetControlID="CatPanel"
                                BorderColor="Black" Enabled="True" Radius="5">
                            </asp:RoundedCornersExtender>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnCat" EventName="ServerClick" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td align="left" style="padding-left: 2px;">
                    <asp:UpdatePanel ID="PwrUpdatePanel" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="PwrPanel" runat="server" CssClass="Grpbox" Width="167px" Height="115px">
                                <table style="margin-top: 5px;">
                                    <tr align="left">
                                        <td style="border: 1px solid #000000; width: 167px;" align="left" valign="top">
                                            <asp:Label ID="Label11" runat="server" CssClass="GrpboxTitle" Text="Power"></asp:Label>
                                            <span style="margin-left: 15px;">
                                                <asp:CheckBox ID="CBPwr" runat="server" Text="Disable" ToolTip="Disable all power filters"
                                                    ClientIDMode="Static" />
                                            </span>
                                            <asp:CheckBoxList ID="CheckBoxLisPwr" runat="server" Font-Bold="True" ForeColor="Black"
                                                RepeatDirection="Horizontal" Font-Size="8pt" ClientIDMode="Static" OnPreRender="CheckBoxLisPwr_PreRender"
                                                TabIndex="3">
                                                <asp:ListItem Text="High" Value="H" />
                                                <asp:ListItem Text="Low" Value="L" />
                                                <asp:ListItem Text="Qrp" Value="Q" />
                                            </asp:CheckBoxList>
                                        </td>
                                    </tr>
                                    <tr align="left">
                                        <td style="border: 1px solid #000000; width: 160px;" align="left" valign="top">
                                            <asp:Label ID="Label10" runat="server" CssClass="GrpboxTitle" Text="Assisted"></asp:Label>
                                            <center>
                                                <asp:CheckBoxList ID="CheckBoxListAst" runat="server" Font-Bold="True" ForeColor="Black"
                                                    RepeatDirection="Horizontal" Font-Size="8pt" ClientIDMode="Static" OnPreRender="CheckBoxListAst_PreRender">
                                                    <asp:ListItem Text="Non" Value="0" />
                                                    <asp:ListItem Text="Assisted" Value="1" />
                                                </asp:CheckBoxList>
                                            </center>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:RoundedCornersExtender ID="RCEPwr" runat="server" TargetControlID="PwrPanel"
                                BorderColor="Black" Enabled="True" Radius="5">
                            </asp:RoundedCornersExtender>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td align="left" style="padding-left: 2px;">
                    <asp:Panel ID="CCDPanel" runat="server" CssClass="Grpbox" Width="258px" Height="120px">
                        <asp:UpdatePanel ID="ctyUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table style="margin-top: 5px;">
                                    <tr align="left">
                                        <td style="border: 1px solid #000000; width: 247px;" align="left">
                                            <asp:Label ID="Label4" runat="server" CssClass="GrpboxTitle" Text="Country"></asp:Label>
                                            <span style="padding-left: 80px">
                                                <asp:Button ID="CtyDef" runat="server" Text="Default" Font-Size="6pt" ToolTip="Set Country to 'All Countries'"
                                                    OnClientClick="CtyDef_C('DDLCty');return false;" ClientIDMode="Static" SkinID="butSkin" />
                                            </span>
                                            <br />
                                            <asp:DropDownList ID="DDLCty" runat="server" Font-Size="7pt" Width="230px" ClientIDMode="Static">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="ConDisUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table style="margin-top: -5px;">
                                    <tr align="left">
                                        <td id="DDLConID" runat="server" style="border: 1px solid #000000; width: 247px;
                                            height: 25px;" align="left">
                                            <asp:Label ID="ConLabel" runat="server" CssClass="GrpboxTitle" Text="Continent" Font-Size="8pt"></asp:Label>
                                            <span style="margin-left: 1px;">
                                                <asp:DropDownList ID="DDLCon" runat="server" Width="48" ClientIDMode="Static">
                                                </asp:DropDownList>
                                            </span><span style="margin-left: 3px;">
                                                <asp:Label ID="DisLabel" runat="server" CssClass="GrpboxTitle" Text="District" Font-Size="8pt"></asp:Label>
                                            </span><span style="margin-left: 1px;">
                                                <asp:DropDownList ID="DDLDis" runat="server" Width="48" ClientIDMode="Static">
                                                </asp:DropDownList>
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DDLCty" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdatePanel ID="CallUpdatePanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <table style="margin-top: -5px;">
                                    <tr align="left">
                                        <td id="Td1" runat="server" align="left" style="border: 1px solid #000000; width: 247px;
                                            height: 25px;">
                                            <asp:Label ID="Label13" runat="server" CssClass="GrpboxTitle" Text="Call"></asp:Label>
                                            <span style="margin-left: 15px;">
                                                <asp:TextBox ID="Calltxtbox" runat="server" Width="100" ClientIDMode="Static"></asp:TextBox>
                                            </span><span style="padding-left: 10px">
                                                <asp:Button ID="CallClr" runat="server" Text="Clear" Font-Size="6pt" ToolTip="Clear the current Call"
                                                    OnClientClick="CallClr_C('Calltxtbox');return false;" ClientIDMode="Static" SkinID="butSkin" />
                                            </span>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" TargetControlID="CCDPanel"
                        BorderColor="Black" Enabled="True" Radius="5">
                    </asp:RoundedCornersExtender>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="GvUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <center>
                    <table style="margin-top: -5px">
                        <tr>
                            <td style="padding-left: 5px;">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderWidth="6px"
                                    Width="100%" CellSpacing="2" DataKeyNames="CID,EntryClass,Call,EntrtyPower,Score,QSOs,Zones,Countries,Assisted"
                                    DataSourceID="ResultsSqlDataSource" BorderColor="Blue" AllowPaging="True" AllowSorting="True"
                                    BorderStyle="Solid" GridLines="None" PageSize="20" OnRowDataBound="GridView1_RowDataBound"
                                    CellPadding="1" EnableViewState="False" OnRowCreated="GridView1_RowCreated" OnSorted="GridView1_Sorted"
                                    ClientIDMode="Inherit">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderText="Call" SortExpression="Call">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="idCall" runat="server" NavigateUrl='<%# "javascript:LogCallClicked(\x27" + Eval("Call", "{0}") +"\x27,\x27" + Eval("ContestID", 
                                                     "{0}") + "\x27)" %>' Text='<%# Eval("Call") %>' />
                                                <%-- <asp:LinkButton ID="idCall" runat="server" OnClientClick='<%# "javascript:LogCallClicked(\x27" + Eval("Call", "{0}") +"\x27,\x27" + Eval("ContestID", 
                                                     "{0}") + "\x27)" %>' Text='<%# Eval("Call") %>'>LinkButton</asp:LinkButton>
                                                --%>
                                            </ItemTemplate>
                                           <ItemStyle HorizontalAlign="Left" CssClass="TdLogbookRowHCallCell" Width="110px">
                                           </ItemStyle>
                                       </asp:TemplateField>
                                       <asp:BoundField DataField="EntryClass" HeaderText="EntryClass" SortExpression="EntryClass"
                                           ItemStyle-HorizontalAlign="Center">
                                           <ItemStyle HorizontalAlign="Left" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="Contestname" HeaderText="Contests" SortExpression="EntryClass">
                                           <ItemStyle Width="120px" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="EntrtyPower" HeaderText="Pwr" SortExpression="EntrtyPower"
                                           ItemStyle-HorizontalAlign="Center">
                                           <ItemStyle HorizontalAlign="Center" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" DataFormatString="{0:#,#}">
                                           <ItemStyle Font-Bold="True" Width="80px" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="Countries" HeaderText="Countries" SortExpression="Countries" />
                                       <asp:BoundField DataField="Zones" HeaderText="Zones" SortExpression="Zones" />
                                       <asp:BoundField DataField="QSOs" HeaderText="QSOs" SortExpression="QSOs" />
                                       <asp:BoundField DataField="Assisted" HeaderText="Assisted" SortExpression="Assisted"
                                           ItemStyle-HorizontalAlign="Center">
                                           <ItemStyle HorizontalAlign="Center" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="OpCall" HeaderText="Operator" SortExpression="OpCall">
                                           <ItemStyle HorizontalAlign="Left" Width="90px" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="Continent" HeaderText="Cont." SortExpression="Continent"
                                           ItemStyle-HorizontalAlign="Center">
                                           <ItemStyle HorizontalAlign="Center" />
                                       </asp:BoundField>
                                   </Columns>
                                   <RowStyle CssClass="TdLogbookRowCell" HorizontalAlign="Right" />
                                   <PagerStyle CssClass="TdHdrStyle" HorizontalAlign="Center" />
                                   <PagerTemplate>
                                       <asp:UpdatePanel ID="UpdatePanelPager" runat="server" UpdateMode="Conditional" EnableViewState="False">
                                           <ContentTemplate>
                                               Goto LOG Page
                                               <asp:DropDownList ID="ddlPageSelector" runat="server" AutoPostBack="False" ClientIDMode="Static"
                                                   CssClass="DBPagerButton">
                                               </asp:DropDownList>
                                               <asp:Button Text="Next" CommandName="Page" CommandArgument="Next" runat="server"
                                                   ID="btnNext" CssClass="DBPagerButton" EnableTheming="False" OnClientClick="PagerKey('btnNext');return false;" />
                                               <asp:Button Text="Previous" CommandName="Page" CommandArgument="Prev" runat="server"
                                                   ID="btnPrevious" EnableTheming="False" CssClass="DBPagerButton" OnClientClick="PagerKey('btnPrevious');return false;" />
                                               <asp:Button Text="Last" CommandName="Page" CommandArgument="Last" runat="server"
                                                   ID="btnLast" CssClass="DBPagerButton" EnableTheming="False" OnClientClick="PagerKey('btnLast');return false;" />
                                               <asp:Button Text="First" CommandName="Page" CommandArgument="First" runat="server"
                                                   ID="btnFirst" CssClass="DBPagerButton" EnableTheming="False" OnClientClick="PagerKey('btnFirst');return false;" />
                                           </ContentTemplate>
                                       </asp:UpdatePanel>
                                   </PagerTemplate>
                                   <HeaderStyle CssClass="TdHdrStyle" />
                                   <AlternatingRowStyle BackColor="#E2E2E2" />
                               </asp:GridView>
                           </td>
                       </tr>
                   </table>
               </center>
           </ContentTemplate>
           <Triggers>
               <asp:AsyncPostBackTrigger ControlID="btnCon" EventName="ServerClick" />
               <asp:AsyncPostBackTrigger ControlID="btnCat" EventName="ServerClick" />
               <asp:AsyncPostBackTrigger ControlID="btnChk" EventName="ServerClick" />
               <asp:AsyncPostBackTrigger ControlID="btnGrid" EventName="ServerClick" />
               <asp:AsyncPostBackTrigger ControlID="btnCall" EventName="ServerClick" />
           </Triggers>
       </asp:UpdatePanel>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
        <input id="btnAddCall" runat="server" type="button" style="display: none" clientidmode="Static" />
      <asp:PopupControlExtender ID="PuceAddCall" runat="server" PopupControlID="PanelAddall"
           TargetControlID="btnAddCall" ClientIDMode="Static" 
           BehaviorID="PuceAddCall" OffsetX="300" OffsetY="300" Position="Right"  />
       <asp:Panel ID="PanelAddall" runat="server" CssClass="popupControl" Width="450px"
           BackColor="White" BorderColor="Red" BorderWidth="2px" BorderStyle="Solid">
           <table>
               <tr align="left">
                   <td valign="top" colspan="2">
                       <table style="width: 440px;">
                           <tr align="center">
                               <td style="font-family: Verdana; font-size: 1.12em; font-weight: bold; color: #FF0000">
                                   SELECT GRAPH CALL TO UPDATE
                               </td>
                           </tr>
                           <tr align="left">
                               <td style="border: 1px solid #000000; font-size: 1.0em; color: black">
                                   Selected New Call: &nbsp;&nbsp;
                                   <br />
                                   <center>
                                       <asp:Label ID="NewLblCall" runat="server" ClientIDMode="Static" Font-Bold="True"
                                           Font-Size="1.12em"></asp:Label>
                                       &nbsp;&nbsp;&nbsp;&nbsp;
                                       <asp:Label ID="NewLblTestID" runat="server" ClientIDMode="Static" Font-Bold="True"
                                           Font-Size="1.12em"></asp:Label><br />
                                       <asp:Button ID="BtnAddCall1" runat="server"  ForeColor="Blue" 
                                           onclientclick="javascript:UpdateSesion('OK','0',1);return false;" 
                                           ToolTip="Click to change Call1" ClientIDMode="Static" 
                                            CssClass="AddCallPU" Width="140px" Font-Size=".75em"  SkinID="butSkin" />
                                       <asp:Button ID="BtnAddCall2" runat="server" Text="Call2: " ForeColor="OrangeRed" 
                                           onclientclick="javascript:UpdateSesion('OK','0',2);return false;" 
                                           ToolTip="Click to change Call2" ClientIDMode="Static" 
                                           CssClass="AddCallPU" Width="140px" Font-Size=".75em" SkinID="butSkin" />
                                        <asp:Button ID="BtnAddCall3" runat="server" Text="Call13: " ForeColor="Green" 
                                           onclientclick="javascript:UpdateSesion('OK','0',3);return false;" 
                                           ToolTip="Click to change Call3" ClientIDMode="Static" 
                                           CssClass="AddCallPU" Width="140px" Font-Size=".75em" SkinID="butSkin" />
                         
                                   </center>
                               </td>
                           </tr>
                           <tr>
                               <td>
                                   <hr />
                                   Current Graph Calls:
                               </td>
                           </tr>
                           <tr>
                               <td style="height: 30px">
                                   <span style="color: #0000FF; font-weight: bold;">Call1: &nbsp;&nbsp;</span>
                                   <asp:Label ID="CurLblCall1" runat="server" ClientIDMode="Static" Font-Bold="True"></asp:Label><br />
                               </td>
                           </tr>
                           <tr>
                               <td style="height: 30px">
                                   <span style="color: #FF4500; font-weight: bold;">Call2: &nbsp;&nbsp;</span>
                                   <asp:Label ID="CurLblCall2" runat="server" ClientIDMode="Static" Font-Bold="True"></asp:Label><br />
                               </td>
                           </tr>
                           <tr>
                               <td style="height: 30px">
                                   <span style="color: #008000; font-weight: bold;">Call3: &nbsp;&nbsp;</span>
                                   <asp:Label ID="CurLblCall3" runat="server" ClientIDMode="Static" Font-Bold="True"></asp:Label><br />
                               </td>
                           </tr>
                       </table>
                   </td>
               </tr>
               <tr align="right">
                   <td>
                       <asp:Button ID="BtnView" runat="server" Font-Size=".75em" Text="View Graph or Chart" 
                        OnClientClick="javascript:UpdateSesion('OK', '1',-1);return false;" SkinID="butSkin" />
                   </td>
                   <td>
                       <asp:Button ID="BtnCancel" runat="server" Font-Size=".75em" Text="Cancel" 
                       OnClientClick="javascript:UpdateSesion('Can','0',-1);return false;" SkinID="butSkin" />
                   </td>
               </tr>
           </table>
       </asp:Panel>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSessionCall" EventName="ServerClick" />
    </Triggers>
        </asp:UpdatePanel>
        <div id="updateProgressDiv" class="updateProgress" style="display: none;">
            <div style="margin-top: 13px; text-align: center;">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/indicator_snake.gif" />
                <span class="updateProgressMessage">QRX Loading ...</span>
            </div>
        </div>

</asp:Panel>
    </div>


    <asp:SqlDataSource ID="ContestSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CqResultsConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CqResultsConnectionString.ProviderName %>"
        SelectCommand="SELECT [ContestName], [CID], [ContestID] FROM [Contests] ORDER BY [ContestID] DESC">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CQWWSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CqResultsConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CqResultsConnectionString.ProviderName %>">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ResultsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CqResultsConnectionString %>"
        ProviderName="<%$ ConnectionStrings:CqResultsConnectionString.ProviderName %>">
    </asp:SqlDataSource>

</asp:Content>
