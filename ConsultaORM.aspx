<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ConsultaORM.aspx.cs" Inherits="ORMWeb.ConsultaORM" %>
<%@ MasterType virtualPath="~/main.Master"%>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v20.1, Version=20.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dxmLite_MaterialCompact .dxctToolbar_MaterialCompact.dxm-main.dxmtb {
            background-color: #ecf0f5;
            padding-top: 2px;
        }
        .dxmLite_MaterialCompact .dxctToolbar_MaterialCompact.dxm-horizontal.dxmtb .dxm-item {
            border: 0px;
            padding-top: 7px;
            width: 170px !important;
            text-align: center;
            border-radius: 2px !important;
        }

        .dxmLite_MaterialCompact .dxctToolbar_MaterialCompact.dxm-horizontal.dxmtb .dxm-image-l .dxm-subMenu.dxm-noImage .dxm-content, .dxmLite_MaterialCompact .dxctToolbar_MaterialCompact.dxm-horizontal.dxmtb .dxm-image-r .dxm-subMenu.dxm-noImage .dxm-content, .dxmLite_MaterialCompact .dxctToolbar_MaterialCompact.dxm-horizontal.dxmtb .dxm-image-l.dxm-noImages .dxm-item .dxm-content, .dxmLite_MaterialCompact .dxctToolbar_MaterialCompact.dxm-horizontal.dxmtb .dxm-image-r.dxm-noImages .dxm-item .dxm-content, .dxmLite_MaterialCompact .dxctToolbar_MaterialCompact.dxm-horizontal.dxmtb .dxm-image-l .dxm-noImage .dxm-content, .dxmLite_MaterialCompact .dxctToolbar_MaterialCompact.dxm-horizontal.dxmtb .dxm-image-r .dxm-noImage .dxm-content {
            width: 100%;
        }
        
    </style>

    <script type="text/javascript">
        $(function() {
            document.getElementById('menuConsultas').classList.add('menu-open');

            var el = document.getElementById('listaConsultasDefault');
            el.style.display = 'block';
        });

        function OnToolbarItemClick(s, e) {
            if (IsCustomExportToolbarCommand(e.item.name)) {
                e.processOnServer = true;
                e.usePostBack = true;
            }
            else {
                if (e.item.name == "EjecutarConsulta") {
                    var capturarParams = '<%= Session["CapturarParametros"].ToString() %>';
                    if (capturarParams == "S") {
                        pcParamsConsulta.Show();
                    }
                    else {
                        grid.PerformCallback();
                    }
                }
                /*else {
                    if (e.item.name == "RefrescarGrid") {
                        grid.Refresh();
                    }
                }*/
            }
        }

        function RefrescarGrid(s, e) {
            //alert("RefrescarGrid");
            grid.Refresh();
        }

        function IsCustomExportToolbarCommand(command) {
            return command == "CustomExportToXLS" || command == "CustomExportToXLSX";
        }

        function ShowLoadingPanel() {
            LoadingPanel.Show();
        }

        function HideLoadingPanel() {
            LoadingPanel.Hide();
        }

        function onFocusedCellChanging(s, e) {
            if (e.cellInfo.column.fieldName != 'VALOR')
                e.cancel = true;
        }

        function ShowPopup(msg) {
            console.log(msg);
            $('#myModal').modal('show');
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function onPivotInit(s, e) {
            if (typeof (pivotCustomizationControl) == 'undefined')
                return;
            setTimeout(function () {
                if (s.GetMainDiv().clientHeight > 400)
                    pivotCustomizationControl.SetHeight(s.GetMainElement().offsetHeight);
                else
                    pivotCustomizationControl.SetHeight(400);
            }, 100);
        }
    </script>

    <dx:ASPxPageControl ID="dataTabPage" Width="100%" Height="780px" runat="server" ActiveTabIndex="0" TabPosition="Top" EnableHierarchyRecreation="True" >
        <TabPages>
            <dx:TabPage Text="Hoja de Datos">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                        <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" Width="100%" 
                            AutoGenerateColumns="True" 
                            OnDataBinding="grid_DataBinding" 
                            OnCustomCallback="grid_CustomCallback"  
                            OnToolbarItemClick="grid_ToolbarItemClick" 
                            EnableCallBacks="true"
                            SettingsLoadingPanel-Mode="ShowAsPopup">
                            <Toolbars>
                                <dx:GridViewToolbar>
                                    <Items>
                                        <dx:GridViewToolbarItem Text="EJECUTAR" Name="EjecutarConsulta" AdaptivePriority="2">
                                            <ItemStyle CssClass="dxbButton_MaterialCompact" />
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem Text="EXPORTAR COMO" Name="Export" BeginGroup="true" AdaptivePriority="1" Image-IconID="actions_download_16x16office2013">
                                            <Items>
                                                <dx:GridViewToolbarItem Name="ExportToXLSX" Command="ExportToXlsx" Text="Documento Excel XLSX" />
                                                <dx:GridViewToolbarItem Name="ExportToXLS" Command="ExportToXls"  Text="Documento Excel XLS" />
                                                <dx:GridViewToolbarItem Name="ExportToCSV" Command="ExportToCsv" Text="Documento de Texto CSV" />
                                                <dx:GridViewToolbarItem Name="ExportToPDF" Command="ExportToPdf" Text="Documento PDF" />
                                                <dx:GridViewToolbarItem Name="ExportToDOCX" Command="ExportToDocx" Text="Documento Word DOCX" />
                                                <dx:GridViewToolbarItem Name="ExportToRTF" Command="ExportToRtf" Text="Documento RTF" />
                                                <dx:GridViewToolbarItem Name="CustomExportToXLSX" Text="Export to XLSX(DataAware)" Image-IconID="export_exporttoxlsx_16x16office2013" />
                                                <dx:GridViewToolbarItem Name="CustomExportToXLS" Text="Export to XLS(DataAware)" Image-IconID="export_exporttoxls_16x16office2013" />
                                            </Items>
                                            <ItemStyle CssClass="dxbButton_MaterialCompact" />
                                        </dx:GridViewToolbarItem>
                                        <dx:GridViewToolbarItem BeginGroup="true" Alignment="Right">
                                            <Template>
                                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Buscar..." Height="100%" Width="500px">
                                                    <Buttons>
                                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                                    </Buttons>
                                                </dx:ASPxButtonEdit>
                                            </Template>
                                        </dx:GridViewToolbarItem>
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                            <Settings HorizontalScrollBarMode="Visible" /> 
                            <Settings VerticalScrollableHeight="460" VerticalScrollBarMode="Visible" VerticalScrollBarStyle="VirtualSmooth" />
                            <Settings ShowGroupPanel="True" ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="true" ShowGroupFooter="VisibleIfExpanded" />
                            <SettingsPager PageSize="13">
                                <PageSizeItemSettings Visible="True" Items="10, 13, 15, 20, 25, 30, 35, 40, 45, 50, 100, 150, 200">
                                </PageSizeItemSettings>
                            </SettingsPager>
                            <SettingsBehavior AllowFocusedRow="true" EnableCustomizationWindow="true" EnableRowHotTrack="true" FilterRowMode="Auto"/>
                            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                            <SettingsContextMenu Enabled="true" RowMenuItemVisibility-ExportMenu-Visible="true" >
                                <RowMenuItemVisibility>
                                    <ExportMenu Visible="True"></ExportMenu>
                                </RowMenuItemVisibility>
                            </SettingsContextMenu>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                            <SettingsSearchPanel Visible="True" />
                            <SettingsPopup>
                                <HeaderFilter Height="300" Width="300">
                                    <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" MinHeight="300" />
                                </HeaderFilter>
                            </SettingsPopup>
                            <ClientSideEvents ToolbarItemClick="OnToolbarItemClick" />
                        </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Tabla Dinámica">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl4" runat="server">
                        <dx:ASPxButton ID="ASPxButton1" ClientInstanceName="buttonRefreshPivot" runat="server" ToolTip="Refrescar datos"
                                       OnClick="buttonRefreshPivot_Click" Text="Refrescar" Width="170px" style="margin-bottom: 10px;"/>
                        <dx:ASPxButton ID="ASPxButton3" ClientInstanceName="buttonShowHideConfigPivot" runat="server" ToolTip="Configurar tabla dinámica"
                                       OnClick="buttonShowHideConfigPivot_Click" Text="Configurar" Width="170px" style="margin-bottom: 10px; margin-left: 10px;"/>
                        <dx:ASPxButton ID="ASPxButton2" ClientInstanceName="buttonSaveAs" runat="server" ToolTip="Exportar y Guardar"
                                       OnClick="buttonSaveAs_Click" Text="Exportar a Excel" Width="170px" style="margin-bottom: 10px; margin-left: 10px;"/>

                         <table Width="100%">
                            <tr>
                                <td ID="colConfig" runat="server" style="padding-right: 8px;" Visible="false" Width="35%">
                                    <dx:ASPxPivotCustomizationControl ID="ASPxPivotCustomizationControl1" ClientInstanceName="pivotCustomizationControl"
                                        runat="server" Layout="BottomPanelOnly2by2" AllowedLayouts="BottomPanelOnly1by4, BottomPanelOnly2by2, StackedDefault, StackedSideBySide"
                                        AllowSort="true" AllowFilter="true" />
                                </td>
                                <td ID="colPivot" runat="server" Width="100%">
                                    <dx:ASPxPivotGrid ID="pivot" ClientInstanceName="pivot" AutoGenerateColumns="True" OnDataBinding="pivot_DataBinding" runat="server" Width="100%" Height="780px">
                                        <OptionsPager RowsPerPage="25" ColumnsPerPage="15" Visible="False" />
                                        <OptionsView VerticalScrollBarMode="Auto" ShowFilterHeaders="True" HorizontalScrollBarMode="Auto" VerticalScrollingMode="Virtual" HorizontalScrollingMode="Virtual" />
                                        <OptionsFilter NativeCheckBoxes="False" />
                                        <OptionsCustomization CustomizationFormStyle="Excel2007" />
                                        <ClientSideEvents Init="onPivotInit" />
                                    </dx:ASPxPivotGrid>
                                    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="pivot" Visible="False" />
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>

    <dx:ASPxPopupControl ID="pcParamsConsulta" runat="server" Width="900" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcParamsConsulta"
        HeaderText="Parámetros" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="true">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="Panel1" runat="server" DefaultButton="btnAceptar">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <dx:ASPxPanel ID="CenterPanel" runat="server" CssClass="centerPanel">
                                <PanelCollection>
                                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grvParams" ClientInstanceName="grvParams" OnDataBinding="grvParams_DataBinding" OnCustomCallback="params_CustomCallback" OnBatchUpdate="grvParams_BatchUpdate" runat="server" KeyFieldName="POSICION" AutoGenerateColumns="false" Width="100%"  >
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Posición" FieldName="POSICION" ReadOnly="True" Width="100" CellStyle-BackColor="#FFFFDC" Settings-AllowSort="False" Settings-AllowGroup="False" Settings-AllowAutoFilter="False" Settings-AllowDragDrop="False" Settings-AllowHeaderFilter="False">
                                                    <Settings AllowDragDrop="False" AllowGroup="False" AllowAutoFilter="False" AllowHeaderFilter="False" AllowSort="False"></Settings>
                                                    <CellStyle BackColor="#FFFFDC"></CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Título" FieldName="TITULO" ReadOnly="True" Width="200" CellStyle-BackColor="#FFFFDC" Settings-AllowSort="False" Settings-AllowGroup="False" Settings-AllowAutoFilter="False" Settings-AllowDragDrop="False" Settings-AllowHeaderFilter="False">
                                                    <Settings AllowDragDrop="False" AllowGroup="False" AllowAutoFilter="False" AllowHeaderFilter="False" AllowSort="False"></Settings>
                                                    <CellStyle BackColor="#FFFFDC"></CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="VALOR" Width="250" Settings-AllowSort="False" Settings-AllowGroup="False" Settings-AllowAutoFilter="False" Settings-AllowDragDrop="False" Settings-AllowHeaderFilter="False" >
                                                    <Settings AllowDragDrop="False" AllowGroup="False" AllowAutoFilter="False" AllowHeaderFilter="False" AllowSort="False"></Settings>
                                                    <BatchEditModifiedCellStyle BackColor="White"></BatchEditModifiedCellStyle>  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descripción" FieldName="DESCRIPCION" ReadOnly="True" Width="350" CellStyle-BackColor="#FFFFDC" Settings-AllowSort="False" Settings-AllowGroup="False" Settings-AllowAutoFilter="False" Settings-AllowDragDrop="False" Settings-AllowHeaderFilter="False">
                                                    <Settings AllowDragDrop="False" AllowGroup="False" AllowAutoFilter="False" AllowHeaderFilter="False" AllowSort="False"></Settings>
                                                    <CellStyle BackColor="#FFFFDC"></CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn Caption="Obligatorio" FieldName="OBLIGATORIO" ReadOnly="True" Width="110" CellStyle-BackColor="#FFFFDC" Settings-AllowSort="False" Settings-AllowGroup="False" Settings-AllowAutoFilter="False" Settings-AllowDragDrop="False" Settings-AllowHeaderFilter="False">
                                                    <PropertiesCheckEdit ValueChecked="S" ValueUnchecked="N" DisplayTextChecked="Si" DisplayTextUnchecked="No" ValueType="System.String" />
                                                    <Settings AllowDragDrop="False" AllowGroup="False" AllowAutoFilter="False" AllowHeaderFilter="False" AllowSort="False"></Settings>
                                                    <CellStyle BackColor="#FFFFDC"></CellStyle>
                                                </dx:GridViewDataCheckColumn>
                                            </Columns>
                                            <SettingsEditing Mode="Batch"></SettingsEditing>
                                            <Settings ShowStatusBar="Hidden" VerticalScrollableHeight="220" VerticalScrollBarMode="Visible" VerticalScrollBarStyle="VirtualSmooth" />
                                            <ClientSideEvents FocusedCellChanging="onFocusedCellChanging" />
                                        </dx:ASPxGridView>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>
                            <dx:ASPxPanel ID="BottomPanel" runat="server" CssClass="bottomPanel">
                                <PanelCollection>
                                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Width="80px" AutoPostBack="False" Style="float: right; margin-right: 8px; margin-top: 8px; margin-bottom: 8px;">
                                            <ClientSideEvents Click="function(s, e) { 
                                                                                grvParams.CancelEdit();
                                                                                grvParams.Refresh();
                                                                                pcParamsConsulta.Hide(); 
                                                                            }" />
                                        </dx:ASPxButton>
                                        <dx:ASPxButton ID="btnAceptar" ClientInstanceName="btnAceptar" runat="server" Text="Aceptar" Width="80px" AutoPostBack="False" Style="float: right; margin-right: 8px; margin-top: 8px; margin-bottom: 8px;" OnClick="btnAceptar_Click">
                                            <ClientSideEvents Click="function(s, e) {
                                                                                grvParams.UpdateEdit();
                                                                                pcParamsConsulta.Hide();
                                                                                //grvParams.PerformCallback();
                                                                                //grid.PerformCallback();
                                                                                //grid.Refresh();
                                                                            }" />
                                        </dx:ASPxButton>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxPanel>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ContentStyle>
            <Paddings PaddingBottom="5px" />
        </ContentStyle>
    </dx:ASPxPopupControl>

    <!-- Modal Popup -->
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-danger" role="document">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: #ff3547 !important; box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12); border: 0; color: #fff !important;">
                    <button type="button" class="close" data-dismiss="modal" style="color: #fff;  opacity: 1.0;">
                        &times;</button>
                    <h4 class="modal-title" style="text-align:left">
                        <asp:Label ID="lblTitle" runat="server" />
                    </h4>
                </div>
                <div class="modal-body" style="background-color: #fff !important; color: #888 !important;">
                    <div class="row vertical-align">
                        <div class="col-sm-3">
                            <p></p>
                            <p class="text-center">
                                <i class="fas fa-times fa-5x"></i>
                            </p>
                        </div>

                        <div class="col-sm-9">
                            <strong><asp:Label ID="lblMessage" runat="server" style="font-size:20px;" /></strong>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="background-color: #fff !important; color: #888 !important; border-top: 1px solid #e5e5e5;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
