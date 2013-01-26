Imports System.Data.SqlClient
Imports System.Data
Partial Class WorkoutSchedule_Default2
    Inherits System.Web.UI.Page
    ' This is where our important dates are stored.  This is done as a page-level property so it can be read from inside any subroutine or function '
    Private Property _dtMyDates As DataTable
        Get
            Return ViewState("_MyDates")
        End Get
        Set(ByVal value As DataTable)
            ViewState("_MyDates") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            LoadMonths()
            LoadYears()
            LoadMyImportantDates() ' load our important dates before the calendar is loaded '
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

    ' Creates a bunch of random event dates and adds them into a page-level DataTable variable '
    Protected Sub LoadMyImportantDates()
        Me._dtMyDates = New DataTable
        Me._dtMyDates.Columns.Add(New DataColumn("MyDate", GetType(System.DateTime))) ' This will hold the event date '
        Me._dtMyDates.Columns.Add(New DataColumn("MyEvent", GetType(System.String))) ' This will hold the event details '
        Me._dtMyDates.Columns.Add(New DataColumn("Important", GetType(System.Boolean)))    ' This will hold a True/False value based on importance '
        Dim dr As DataRow = Me._dtMyDates.NewRow()
        dr.Item("MyDate") = New DateTime(2013, 9, 1)
        dr.Item("MyEvent") = "First day of the month - celebrate!"
        dr.Item("Important") = False
        Me._dtMyDates.Rows.Add(dr)
        dr = Me._dtMyDates.NewRow()
        dr.Item("MyDate") = New DateTime(2013, 9, 3)
        dr.Item("MyEvent") = "Pester boss for huge payrise based on this beautiful piece of code"
        dr.Item("Important") = False
        Me._dtMyDates.Rows.Add(dr)
        dr = Me._dtMyDates.NewRow()
        dr.Item("MyDate") = New DateTime(2013, 9, 3)
        dr.Item("MyEvent") = "Sulk about boss's decision"
        dr.Item("Important") = False
        Me._dtMyDates.Rows.Add(dr)
        dr = Me._dtMyDates.NewRow()
        dr.Item("MyDate") = New DateTime(2013, 9, 9)
        dr.Item("MyEvent") = "Take over the company"
        dr.Item("Important") = False
        Me._dtMyDates.Rows.Add(dr)
        dr = Me._dtMyDates.NewRow()
        dr.Item("MyDate") = New DateTime(2013, 9, 10)
        dr.Item("MyEvent") = "Fire previous boss for refusing to give me that payrise"
        dr.Item("Important") = True
        Me._dtMyDates.Rows.Add(dr)
        dr = Me._dtMyDates.NewRow()
        dr.Item("MyDate") = New DateTime(2013, 9, 12)
        dr.Item("MyEvent") = "Kick back and soak up the sun at my new company-funded luxury villa"
        dr.Item("Important") = False
        Me._dtMyDates.Rows.Add(dr)
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
        Dim ltl_dayEvents As Literal = CType(e.Item.FindControl("ltl_dayEvents"), Literal)
        ' Set values '
        Dim d As DateTime = CType(e.Item.DataItem, DateTime)
        ' Here we set the day value for each day entry within the calendar ' 
        Dim sb As New StringBuilder
        sb.Append(d.Day.ToString)
        sb.Append(" ")
        sb.Append(d.ToString("dddd"))    ' gets the day name based on the users computer settings (their local day name rather than English default) '
        lnk_dayLink.Text = sb.ToString
        lnk_dayLink.CommandArgument = d     ' used to read the date value when the link is clicked ' 
        ' Check to see if we have any dates matching today '
        Dim dvr As New DataView(Me._dtMyDates)
        ' use DateTime.ToShortDateString below because the DataTable by default creates a Time after the Date value '
        '(e.g. 1/9/2012 00:00.00), so this forces a string match by removing the time component'
        dvr.RowFilter = String.Format("MyDate='{0}'", d.ToShortDateString)
        Dim dt As DataTable = dvr.ToTable ' returns the results as a temporary DataTable '
        If dt.Rows.Count > 0 Then ' if any dates are found '
            Dim sb_day As New StringBuilder
            For Each dr As DataRow In dt.Rows
                sb_day.Append("<p class=""event")
                If Convert.ToBoolean(dr.Item("Important")) Then
                    sb_day.Append(" important")
                End If
                sb_day.Append(""">")
                sb_day.Append(dr.Item("MyEvent").ToString)
                sb_day.Append("</p>")
            Next
            ltl_dayEvents.Text = sb_day.ToString
        End If
    End Sub

    Protected Sub DayLinkClicked(ByVal sender As Object, ByVal e As CommandEventArgs) ' Handles set by rpt_calendar_ItemCreated() '
        Dim d As DateTime = Convert.ToDateTime(e.CommandArgument)
        ltl_output.Text = "<p>You clicked " & d.ToShortDateString() & "</p>"
    End Sub
End Class
