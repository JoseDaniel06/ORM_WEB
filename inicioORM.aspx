<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="inicioORM.aspx.cs" Inherits="ORMWeb.inicioORM" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v20.1, Version=20.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">

    <script type="text/javascript">
        function ShowMensajeError() {
            $('#myModal').modal('show');
        }
    </script>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Modal Popup -->
    <div id="myModal" class="modal fade" role="dialog" style="z-index: 10000000 !important;">
        <div class="modal-dialog modal-danger" role="document">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background-color: #ff3547 !important; box-shadow: 0 2px 5px 0 rgba(0,0,0,.16), 0 2px 10px 0 rgba(0,0,0,.12) !important; border: 0 !important; color: #fff !important;">
                    <button type="button" class="close" data-dismiss="modal" style="color: #fff;  opacity: 1.0;">
                        &times;</button>
                    <h4 class="modal-title" style="text-align:left; font-size: 18px; font-family: 'Roboto', sans-serif !important; font-weight: 500;">
                        <asp:Label ID="lblTitle" runat="server" />
                    </h4>
                </div>
                <div class="modal-body" style="background-color: #fff !important; font-family: 'Roboto', sans-serif !important; font-size: 16px !important; font-weight: 300 !important; color: #888 !important; line-height: 30px !important;">
                    <div class="row vertical-align">
                        <div class="col-sm-3">
                            <p></p>
                            <p class="text-center">
                                <i class="fas fa-times fa-5x"></i>
                            </p>
                        </div>

                        <div class="col-sm-9">
                            <strong><asp:Label ID="lblMessage" runat="server" style="font-size:20px; font-family: 'Roboto', sans-serif !important; color: #888; font-weight: 500 !important;" /></strong>
                        </div>
                    </div>
                </div>
                <div class="modal-footer" style="background-color: #fff !important; font-family: 'Roboto', sans-serif !important; font-size: 16px !important; font-weight: 300 !important; color: #888 !important; line-height: 30px !important; border-top: 1px solid #e5e5e5;">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="height:780px; display: flex; align-items: center;">
        <img src="img/ORM-2017v2.png" style="display: block; margin-left: auto;  margin-right: auto;  width: 50%;"/>
    </div>

</asp:Content>
