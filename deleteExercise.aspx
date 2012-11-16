<%@ Page Language="C#" AutoEventWireup="true" CodeFile="deleteExercise.aspx.cs" Inherits="deleteExercise" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
            SelectMethod="getExercises" TypeName="ExerciseManager"></asp:ObjectDataSource>
        <p>Select an exercise to delete:<asp:DropDownList ID="DropDownList1" runat="server" 
                AutoPostBack="True" DataSourceID="ObjectDataSource2" DataTextField="name" 
                DataValueField="id">
        </asp:DropDownList></p>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Delete" onclick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
    <br />
    <div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="getExercises" TypeName="ExerciseManager"></asp:ObjectDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ObjectDataSource1">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="equipment" HeaderText="equipment" 
                SortExpression="equipment" />
            <asp:BoundField DataField="videoLink" HeaderText="videoLink" 
                SortExpression="videoLink" />
            <asp:CheckBoxField DataField="rep" HeaderText="rep" SortExpression="rep" />
            <asp:CheckBoxField DataField="weight" HeaderText="weight" 
                SortExpression="weight" />
            <asp:CheckBoxField DataField="distance" HeaderText="distance" 
                SortExpression="distance" />
            <asp:CheckBoxField DataField="time" HeaderText="time" SortExpression="time" />
            <asp:CheckBoxField DataField="enabled" HeaderText="enabled" 
                SortExpression="enabled" />
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
        </Columns>
    </asp:GridView>
    </div>

    </form>
</body>
</html>
