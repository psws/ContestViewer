
        var _updateProgressDiv;
        var _tabContainer;
        var _btnSelectedTab;
        var _btnSelectedTabContainer;
        var _btnContestrigger;
        var _DDLOpr;
        var _DDLPwr;
        var _DDLBnd;
        var _DDLAssist;
        var _DDLTx;
        var _CategoryCB;
        
       
        function pageLoad(sender, args) {
            //  register for our events
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);
 
            _tabContainer = $get('QSORateChart');
            _updateProgressDiv = $get('updateProgressDiv');
            //With script sourced from scriptmanagerproxy the controls have to be 
            //loaded int PageLoad. Get inside tab cjanged below does not work
            _btnSelectedTab = $get('btnSelectedTab');
            _btnSelectedTabContainer = $get('btnSelectedTabContainer');
            _btnContestrigger1 = $get('btnContestrigger1');
            _btnContestrigger2 = $get('btnContestrigger2');
            _btnContestrigger3 = $get('btnContestrigger3');
            _btnCat = $get('btnCat');
            _btnLog = $get('btnLog');
            _btnCall = $get('btnCall');
            _btnChart = $get('btnChart');
            _DDLOpr = $get('DDLOpr');
            _DDLPwr = $get('DDLPwr');
            _DDLBnd = $get('DDLBnd');
            _DDLAssist = $get('DDLAssist');
            _DDLTx = $get('DDLTx');

            _DDLLBnd = $get('DDLLBnd');
            _DDLLCon = $get('DDLLCon');
            _DDLLCou = $get('DDLLCou');
            _DDLLZone = $get('DDLLZone');

            if (!Sys.WebForms.PageRequestManager.getInstance().get_isInAsyncPostBack()) {
//                setTimeout('load1stgraph()', 1000);
                _btnInit = $get('btnInit');
                _updateProgressDiv.style.display = '';
                // get the bounds of both the gridview and the progress div
                var tabContainerwBounds = Sys.UI.DomElement.getBounds(_tabContainer);
                var updateProgressDivBounds = Sys.UI.DomElement.getBounds(_updateProgressDiv);

                //  center of gridview
                var x = tabContainerwBounds.x + Math.round(tabContainerwBounds.width / 2) - Math.round(updateProgressDivBounds.width / 2);
                var y = tabContainerwBounds.y + Math.round(tabContainerwBounds.height / 2) - Math.round(updateProgressDivBounds.height / 2);

                //	set the progress element to this position
                Sys.UI.DomElement.setLocation(_updateProgressDiv, x, y);
                __doPostBack(_btnInit.name, '');
            }           

        }

        function load1stgraph() {
            _btnInit = $get('btnInit');
            _updateProgressDiv.style.display = '';
            __doPostBack(_btnInit.name, '');
        }

        function MybeginRequest(Obj) {
//            _tabContainer = $get(sender._element.id);

            // make it visible
            _updateProgressDiv.style.display = '';

            // get the bounds of both the gridview and the progress div
            var tabContainerwBounds = Sys.UI.DomElement.getBounds(Obj);

            //  center of gridview
            var x = tabContainerwBounds.x + Math.round(tabContainerwBounds.width / 2) - Math.round(180 / 2);
            var y = tabContainerwBounds.y + Math.round(tabContainerwBounds.height / 2) - Math.round(50 / 2);

            //	set the progress element to this position
            Sys.UI.DomElement.setLocation(_updateProgressDiv, x, y);
        }

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
        }

        function RefreshGraph(sender) {
            var _ChartContainer = $get(sender);
            MybeginRequest(_ChartContainer);

        }

        function CatChanged(obj, index) {
            
            switch (index) {
                case 1:
                    SetCatDDL(obj);
                    break;
                default:
                    break;
            }
            _btnSelectedTabContainer.value = index.toString();
            __doPostBack(_btnCat.name, '');
            MybeginRequest(_tabContainer);
        }

        function SetCatDDL(obj) {
            _DDLOpr.disabled = false;
            selitem = obj[obj.selectedIndex].text;
            if (selitem == "SINGLE-OP") {
                _DDLPwr.disabled = false;
                _DDLBnd.disabled = false;
                _DDLAssist.disabled = false;
                _DDLTx.disabled = true;
            }
            else if (selitem == "MULTI-OP") {
                _DDLPwr.disabled = true;
                _DDLBnd.disabled = true;
                _DDLAssist.disabled = true;
                _DDLTx.disabled = false;
            }
            else if (selitem == "CHECKLOG") {
                _DDLPwr.disabled = true;
                _DDLBnd.disabled = true;
                _DDLAssist.disabled = true;
                _DDLTx.disabled = true;
            }
            else {
                _DDLPwr.disabled = true;
                _DDLBnd.disabled = true;
                _DDLAssist.disabled = true;
                _DDLTx.disabled = true;
            }
        }
        

        function LogChanged(obj, index) {
            selitem = obj[obj.selectedIndex].text;
            switch (index) {
                case 1:
//                    if (selitem == "ALL") {
//                        _DDLLCon.disabled = false;
//                        _DDLLCou.disabled = false;
//                        _DDLLZone.disabled = false;
//                    }
                   break;
                case 2:
                    if (selitem != "ALL") {
                        _DDLLCon.disabled = false;
                        _DDLLCou.disabled = true;
                        _DDLLZone.disabled = true;
                    } else {
                        _DDLLCon.disabled = false;
                        _DDLLCou.disabled = false;
                        _DDLLZone.disabled = false;
                    }
                    break;
                case 3:
                    if (selitem != "ALL Countries") {
                        _DDLLCon.disabled = true;
                        _DDLLCou.disabled = false;
                        _DDLLZone.disabled = true;
                    } else {
                        _DDLLCon.disabled = false;
                        _DDLLCou.disabled = false;
                        _DDLLZone.disabled = false;
                    }
                    break;
                case 4:
                    if (selitem != "ALL") {
                        _DDLLCon.disabled = true;
                        _DDLLCou.disabled = true;
                        _DDLLZone.disabled = false;
                    } else {
                        _DDLLCon.disabled = false;
                        _DDLLCou.disabled = false;
                        _DDLLZone.disabled = false;
                    }
                    break;
                default:
                    break;

            }
            _btnSelectedTabContainer.value = index.toString() ;
            __doPostBack(_btnLog.name, '');
            MybeginRequest(_tabContainer);
        }

        function DefaultAll(obj) {
            _btnSelectedTabContainer.value = "0";
            MybeginRequest(_tabContainer);
        }


        function CatDef(obj) {
            _btnSelectedTabContainer.value = "0";
            MybeginRequest(_tabContainer);
        }

        function LogDef(obj) {
            _btnSelectedTabContainer.value = "0";
            MybeginRequest(_tabContainer);
        }

        function ContestViewFilterDef(obj) {
            _btnSelectedTabContainer.value = "0";
            MybeginRequest(_tabContainer);
        }

        function TimeDef(obj) {
            _btnSelectedTabContainer.value = "0";
            MybeginRequest(_tabContainer);
        }


        function ChartChanged(obj, index) {
            _btnSelectedTabContainer.value = index.toString();
            __doPostBack(_btnChart.name, '');
            MybeginRequest(_tabContainer);
        }
        
        function ContestChanged(obj, index) {
            switch (index)    
            {
                case '1':
                    _btnSelectedTabContainer.value = "1";
                    __doPostBack(_btnContestrigger1.name, '');
                    break;
                case '2':
                    _btnSelectedTabContainer.value = "2";
                    __doPostBack(_btnContestrigger2.name, '');
                    break;
                case '3':
                    _btnSelectedTabContainer.value = "3";
                    __doPostBack(_btnContestrigger3.name, '');
                    break;
                default:
                    break;
            }
            MybeginRequest(_tabContainer);
        }

        function CatCBChanged(obj) {
            if (obj.checked == true) {
                _DDLOpr.disabled = true;
                _DDLPwr.disabled = true;
                _DDLBnd.disabled = true;
                _DDLAssist.disabled = true;
                _DDLTx.disabled = true;
            } else {
                SetCatDDL(_DDLOpr);
            }
            _btnSelectedTabContainer.value = "6";
            __doPostBack(_btnCat.name, '');
            MybeginRequest(_tabContainer);
        }

        function QsoCBChanged(obj) {
            if (obj.checked == true) {
                _DDLLBnd.disabled = true;
                _DDLLCon.disabled = true;
                _DDLLCou.disabled = true;
                _DDLLZone.disabled = true;
            } else {
                _DDLLBnd.disabled = false;
                if (_DDLLCon[_DDLLCon.selectedIndex].text == "ALL" && _DDLLCou[_DDLLCou.selectedIndex].text == "ALL Countries"
                            && _DDLLZone[_DDLLZone.selectedIndex].text == "ALL") {
                    _DDLLCon.disabled = false;
                    _DDLLCou.disabled = false;
                    _DDLLZone.disabled = false;
                } else if (_DDLLCon[_DDLLCon.selectedIndex].text != "ALL") {
                    _DDLLCon.disabled = false;
                    _DDLLCou.disabled = true;
                    _DDLLZone.disabled = true;
                } else if (_DDLLCou[_DDLLCou.selectedIndex].text != "ALL Countries") {
                    _DDLLCon.disabled = true;
                    _DDLLCou.disabled = false;
                    _DDLLZone.disabled = true;
                } else if (_DDLLZone[_DDLLZone.selectedIndex].text != "ALL") {
                    _DDLLCon.disabled = true;
                    _DDLLCou.disabled = true;
                    _DDLLZone.disabled = false;
                }
            }
            _btnSelectedTabContainer.value = "5";
            __doPostBack(_btnLog.name, '');
            MybeginRequest(_tabContainer);
        }

        function CallCBChanged(obj, index) {
            _btnSelectedTabContainer.value = index;
            var _btnCallcb = $get("btnCallcb");
            __doPostBack(_btnCallcb.name, '');
//            __doPostBack(_btnCall.name, '');
            MybeginRequest(_tabContainer);
        }


        
        function cTC(sender, args) { //clTabCall
            var nd;
            var up;
            var tg;
            var ieversion
            if (/MSIE (\d+\.\d+);/.test(navigator.userAgent)) {
                ieversion = new Number(RegExp.$1);
                if (ieversion < 9) {
                    nd = 2;
                    up = 1;
                    lg = 0;
                    tg = 0;
                } else {
                    nd = 4;
                    up = 2;
                    lg = 0;
                    tg = 1;
                }       
            } else {
                nd = 4;
                up = 2;
                lg = 0;
                tg = 1;
            }
            //  see if the table elements for the grids exist yet
            var SelectedTab = sender._tabs[sender._activeTabIndex];

            if (SelectedTab._element.childNodes.length == nd) {
                //check if datalist is empty
                if (SelectedTab._element.childNodes[up].children.length == lg) {
                    _btnSelectedTab.value = sender.get_activeTabIndex().toString();
                    _btnSelectedTabContainer.value = sender._element.id; // sender.get_id();
                    var name = SelectedTab._element.childNodes[tg].name;
//                    alert(name);
                    __doPostBack(name, '');
                    MybeginRequest(sender._element);

                }
            }


            //            if (SelectedTab._element.childNodes.length == 3) 
            //            {
            //                //check if datalist is empty
            //                if (SelectedTab._element.childNodes[2].firstChild == null) {
            //                    _btnSelectedTab = $get('<%= btnSelectedTab.UniqueID %>');
            //                    _btnSelectedTab.value = sender.get_activeTabIndex().toString();
            //                    _btnSelectedTabContainer = $get('<%= btnSelectedTabContainer.UniqueID %>');
            //                    _btnSelectedTabContainer.value = sender._element.id;// sender.get_id();
            //                    var name = SelectedTab._element.childNodes[0].name;
            //                    __doPostBack(name, ''); 
            //                }
            //            }

        }



        function cT(puname) {
            var Puce = $find(puname);
            Puce.hidePopup();
        }

        function cQ(linkbut, puname, TbName) { //clickcall
//            var tb = $get('<%= this.TextBoxCall1.ClientID %>');
            var tb = $get(TbName);
            _btnSelectedTabContainer.value = "1";

            tb.setAttribute("value", linkbut.innerHTML);
            var tabc = linkbut.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.id;
            var tc = $find(tabc);
            tb = tc.get_activeTabIndex();
            _tcg = $get(tabc);
            var SelectedDL = _tcg.children[1].children[parseInt(tb)].children[1].children[0];
            if (SelectedDL != null) {
// Hoprizontal    for (i = 1; i < SelectedDL.children.length; i++) {
//                    SelectedDL.childNodes[i].children[0].className = 'normalfld';
//                }
// 
               for (i = 1; i < SelectedDL.children.length; i++) {
                   if (SelectedDL.childNodes[i].children.length) {
                        SelectedDL.childNodes[i].children[0].className = 'nfld';
                   }
                }
            }

            linkbut.className = 'ffld';
            var Puce = $find(puname);
            Puce.hidePopup();
            __doPostBack(_btnCall.name, '');
            MybeginRequest(_tabContainer);

        }

        function CallSelected(obj, id) {
            obj.select();
        }
        function CallUppercase(obj) {
            obj.value = obj.value.toUpperCase();
        }
        function CallMouseup() {
        }

        function CallTextChanged(obj, event, puname) {
            k = event.keyCode;
            if (k == 0xd) {
                var Puce = $find(puname);
                Puce.hidePopup();
                obj.blur();//move cursor
                _btnSelectedTabContainer.value = "1";
                __doPostBack(_btnCall.name, '');
                MybeginRequest(_tabContainer);
            } 
        }
    