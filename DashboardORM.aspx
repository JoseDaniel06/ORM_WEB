<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="DashboardORM.aspx.cs" Inherits="ORMWeb.DashboardORM" %>

<%@ Register Assembly="DevExpress.Dashboard.v20.1.Web.WebForms, Version=20.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            document.getElementById('menuTableros').classList.add('menu-open');

            var el = document.getElementById('listaTablerosDefault');
            el.style.display = 'block';
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxDashboard ID="Dash" runat="server" OnDashboardLoading="Dash_DashboardLoading" WorkingMode="ViewerOnly" Height="866px"></dx:ASPxDashboard>
</asp:Content>
