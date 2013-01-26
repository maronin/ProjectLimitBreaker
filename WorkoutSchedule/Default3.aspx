<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default3.aspx.vb" Inherits="WorkoutSchedule_Default3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Bespoke ASP.NET Calendar (not using asp:calendar)</title>
    <style type="text/css">
        * {font-family:Arial, Gadget, sans-serif}
        h1 {font-size:10pt}
        .calendar {background-color:#eeeeee; border:2px outset #cccccc; padding:1em; margin:1em}
        .calendarMonthSelector {border:1px solid #999999; padding:0.25em; background-color:#aa0000}
        .calendarMonthSelector a {color:white; font-weight:bold}
        .calendarDay {border:1px solid #999999; margin:0.2em; background-color:white; font-size:smaller; padding:0.1em; width:200px; float:left; height:150px; overflow-y:scroll}
        .event {margin:0.25em auto 0.25em 1em; padding:0.1em}
        .important {font-weight:bold; color:#990000}
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </asp:Panel>
                </ItemTemplate>
            </asp:Repeater>
            <div style="clear:both; height:0; overflow:hidden">&nbsp;</div> <!-- This is needed to force the container (inc. background) around all the days if Days are floated with CSS -->
        </asp:Panel>
    </form>
</body>
</html>