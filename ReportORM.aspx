<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="ReportORM.aspx.cs" Inherits="ORMWeb.ReportORM" %>

<%@ Register Assembly="DevExpress.XtraReports.v20.1.Web.WebForms, Version=20.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            document.getElementById('menuReportes').classList.add('menu-open');

            var el = document.getElementById('listaReportesDefault');
            el.style.display = 'block';
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxWebDocumentViewer ID="Report" runat="server"></dx:ASPxWebDocumentViewer>
</asp:Content>

