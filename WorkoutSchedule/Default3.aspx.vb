Imports System.Data.SqlClient
Imports System.Data
Partial Class WorkoutSchedule_Default3
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            LoadMonths()
            LoadYears()
            LoadCalendar()
        End If
    End Sub

    Protected Sub LoadMonths()
        For i As Integer = 1 To 12
            Dim li As New ListItem
            li.Text = MonthName(i) ' MonthName() gets the month name based on the users computer settings (their local month name rather than English default) '
            li.Value = i.ToString
            ddl_month.Items.Add(li)
            If li.Value = DateTime.Now.Month.ToString Then
                li.Selected = True
            End If
        Next
    End Sub

    Protected Sub LoadYears()
        Dim yearsBack As Integer = 3
        Dim yearsForward As Integer = 3
        For i As Integer = DateTime.Now.AddYears(-yearsBack).Year To DateTime.Now.AddYears(yearsForward).Year
            Dim li As New ListItem
            li.Text = i.ToString
            li.Value = i.ToString
            ddl_year.Items.Add(li)
            If li.Value = DateTime.Now.Year Then
                li.Selected = True
            End If
        Next
    End Sub

    Protected Sub lnk_loadCalendar_Click(ByVal sender As Object, ByVal e As EventArgs) Handles lnk_loadCalendar.Click
        LoadCalendar()
    End Sub

    Protected Sub LoadCalendar()
        Dim m As Integer = Convert.ToInt16(ddl_month.SelectedItem.Value)
        Dim y As Integer = Convert.ToInt16(ddl_year.SelectedItem.Value)
        Dim dates As New List(Of DateTime)
        For i As Integer = 1 To Date.DaysInMonth(y, m)
            Dim d As New DateTime(y, m, i)
            dates.Add(d)
        Next
        rpt_calendar.DataSource = dates
        rpt_calendar.DataBind()
    End Sub

    Protected Sub rpt_calendar_ItemCreated(ByVal sender As Object, ByVal e As RepeaterItemEventArgs) Handles rpt_calendar.ItemCreated
        Dim lnk_dayLink As LinkButton = CType(e.Item.FindControl("lnk_dayLink"), LinkButton)
        AddHandler lnk_dayLink.Command, AddressOf DayLinkClicked ' tell ASP.NET to fire DayLinkClicked() when the linkbutton is clicked '
    End Sub

    Protected Sub rpt_calendar_ItemDataBound(ByVal sender As Object, ByVal e As RepeaterItemEventArgs) Handles rpt_calendar.ItemDataBound
        ' Find controls '
        Dim pnl_calendarDay As Panel = CType(e.Item.FindControl("pnl_calendarDay"), Panel)
        Dim lnk_dayLink As LinkButton = CType(e.Item.FindControl("lnk_dayLink"), LinkButton)
        ' Set values '
        Dim d As DateTime = Convert.ToDateTime(e.Item.DataItem())
        ' Here we set the day value for each day entry within the calendar ' 
        Dim sb As New StringBuilder
        sb.Append(d.Day.ToString)
        sb.Append(" ")
        sb.Append(d.ToString("dddd"))    ' gets the day name based on the users computer settings (their local day name rather than English default) '
        lnk_dayLink.Text = sb.ToString
        lnk_dayLink.CommandArgument = d     ' used to read the date value when the link is clicked ' 
    End Sub

    Protected Sub DayLinkClicked(ByVal sender As Object, ByVal e As CommandEventArgs) ' Handles set by rpt_calendar_ItemCreated() '
        Dim d As DateTime = Convert.ToDateTime(e.CommandArgument)
        ltl_output.Text = "<p>You clicked " & d.ToShortDateString() & "</p>"
    End Sub
End Class
