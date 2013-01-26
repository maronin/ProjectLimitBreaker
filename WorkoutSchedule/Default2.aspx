﻿<%@ Page Title="" Language="VB" MasterPageFile="~/ui/mp/MasterPage.master" AutoEventWireup="false"
    CodeFile="Default2.aspx.vb" Inherits="WorkoutSchedule_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <h1>ASP.NET Calendar without using &lt;ASP:Calendar /&gt;</h1>
        <asp:Literal runat="server" ID="ltl_output" />
        <asp:Panel ID="pnl_calendar" runat="server" CssClass="calendar">
            <asp:Panel ID="pnl_monthSelector" runat="server" CssClass="calendarMonthSelector">
                <asp:DropDownList ID="ddl_month" runat="server" />
                <asp:DropDownList ID="ddl_year" runat="server" />
                <asp:LinkButton ID="lnk_loadCalendar" runat="server" Text="Go" />
            </asp:Panel>
            <asp:Repeater ID="rpt_calendar" runat="server">
                <ItemTemplate>
                    <asp:Panel ID="pnl_calendarDay" runat="server" CssClass="calendarDay">
                        <asp:LinkButton ID="lnk_dayLink" runat="server" />
                        <asp:Literal ID="ltl_dayEvents" runat="server" />
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
            <div style="clear:both; height:0; overflow:hidden">&nbsp;</div> <!-- This is needed to force the container (inc. background) around all the days if Days are floated with CSS -->
        </asp:Panel>
</asp:Content>
