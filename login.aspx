<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Default.aspx">
</asp:Login>
<asp:LoginStatus ID="LoginStatus1" runat="server" />
<asp:LoginName ID="LoginName1" runat="server" />
</asp:Content>

