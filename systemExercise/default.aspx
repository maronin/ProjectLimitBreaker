<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="Default" %>
<<<<<<< HEAD
<%@ Register src="ucDeleteExercise.ascx" tagname="ucDeleteExercise" tagprefix="uc1" %>
<%@ Register src="ucEnableExercise.ascx" tagname="ucEnableExercise" tagprefix="uc2" %>
=======
<%@ Register Src="~/ui/uc/AddNewExercise.ascx" TagName="addExercise" TagPrefix="uc1" %>
<%@ Register src="~/ui/uc/ucDeleteExercise.ascx" tagname="ucDeleteExercise" tagprefix="uc2" %>
>>>>>>> 7948d14067fee6b6ebc0e3352a14bd207237158f

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <h3>Manage System Exercises</h3>
    <h4>Add system exercises</h4>
    <uc1:addExercise ID="courses" runat="server" />
    <h4>Delete system exercise</h4>
    <uc2:ucDeleteExercise ID="ucDeleteExercise" runat="server" />
    <h4>Disable system exercise</h4>
<<<<<<< HEAD
        <uc2:ucEnableExercise ID="ucEnableExercise" runat="server" />
    <h4>Modify system exercise</h4>
=======
>>>>>>> 7948d14067fee6b6ebc0e3352a14bd207237158f
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="getAllExercises" TypeName="Layer2Manager"></asp:ObjectDataSource>
        <asp:DropDownList ID="ddlExercises" runat="server" 
            onselectedindexchanged="ddlExercises_SelectedIndexChanged" 
            DataSourceID="ObjectDataSource1" DataTextField="name" DataValueField="id" Visible="False">
        </asp:DropDownList>
        </div>
</asp:Content>

