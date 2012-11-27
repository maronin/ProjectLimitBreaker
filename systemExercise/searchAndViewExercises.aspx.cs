using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SystemExerciseManager manager = new SystemExerciseManager();

    protected void Page_Load(object sender, EventArgs e)
    {
        exerciseAutoComplete.SourceList = manager.getExerciseNamesAC();
    }
    protected void exerciseSearchButton_Click(object sender, EventArgs e)
    {
        List <Exercise> foundExercises=manager.getExercisesByName(exerciseSearchBox.Text.Trim());
        ExerciseDDL.Items.Clear();
        foreach (Exercise name in foundExercises)
        {
            ExerciseDDL.Items.Add(name.name);
        }
    }
    protected void MuscleGroupRBL_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Exercise> foundExercises = manager.getExercisesByMuscleGroup(MuscleGroupRBL.SelectedValue.Trim());
        ExerciseDDL.Items.Clear();
        foreach (Exercise name in foundExercises)
        {
            ExerciseDDL.Items.Add(name.name);
        }
    }
}