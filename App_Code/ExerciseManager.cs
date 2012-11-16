using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ExerciseManager
/// </summary>
public class ExerciseManager
{
	public ExerciseManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public List<ExerciseBase> getExercises() 
    {
        using (var context = new Layer2Container())
        {
            return context.ExerciseBases.OrderBy(s => s.MuscleGroups).ToList();
        }
    }

    public bool deleteExerciseById(int id)
    {
        bool result = true;
        using (var context = new Layer2Container())
        {
            try
            {
                var exercise = context.ExerciseBases.Where(s => s.id == id).FirstOrDefault();
                /*List<ScheduledExercise> scheduledExercises = context.ScheduledExercises.Where(s => s.ExerciseBase.id == id).ToList();

                for (int i=0; i<scheduledExercises.Count(); i++)
                {
                    
                }*/

                exercise.MuscleGroups.Clear();
                exercise.LoggedExercise.Clear();
                context.ExerciseBases.DeleteObject(exercise);
                context.SaveChanges();
            }

            catch (Exception e)
            {
                result = false;
            }
        }

        return result;
    }
}