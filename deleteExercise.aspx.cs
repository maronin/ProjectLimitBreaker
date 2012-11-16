using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deleteExercise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ExerciseManager deleter = new ExerciseManager();

        bool result = deleter.deleteExerciseById(Convert.ToInt32(DropDownList1.SelectedItem.Value));

        if (result)
        {
            Label1.Text = "it worked";
        }

        else
        {
            Label1.Text = "it did not work";
        }
    }
}