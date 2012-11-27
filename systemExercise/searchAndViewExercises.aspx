<%@ Page Title="" Language="C#" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="true"
    CodeFile="searchAndViewExercises.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="Server">
        </asp:ScriptManager>
        <label for="_Default">
            Search for an exercise via name:
        </label>
        <!-- Need a checker below to avoid the following symbols !@#$%^&*()-+|\}{[]"':;/?.>,<~` -->
        <asp:TextBox runat="server" ID="exerciseSearchBox" ClientIDMode="Static" 
            AutoPostBack="False" />
        <juice:Autocomplete ID="exerciseAutoComplete" runat="server" TargetControlID="exerciseSearchBox" />
        <asp:Button ID="exerciseSearchButton" runat="server" Text="Search" OnClick="exerciseSearchButton_Click" />
        <br />
        Search via muscle groups: 
        <asp:RadioButtonList ID="MuscleGroupRBL" runat="server" 
            onselectedindexchanged="MuscleGroupRBL_SelectedIndexChanged">
            <asp:ListItem>Chest</asp:ListItem>
            <asp:ListItem>Back</asp:ListItem>
            <asp:ListItem>Shoulders</asp:ListItem>
            <asp:ListItem>Arms</asp:ListItem>
            <asp:ListItem>Legs</asp:ListItem>
        </asp:RadioButtonList>
        <asp:DropDownList ID="ExerciseDDL" runat="server">
        </asp:DropDownList>
    </div>
</asp:Content>
