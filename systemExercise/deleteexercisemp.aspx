<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true" CodeFile="deleteexercisemp.aspx.cs" Inherits="systemExercise_deleteexercisemp" %>

<%@ Register src="ucDeleteExercise.ascx" tagname="ucDeleteExercise" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:ucDeleteExercise ID="ucDeleteExercise" runat="server" />

</asp:Content>

