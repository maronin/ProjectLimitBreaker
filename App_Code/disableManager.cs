using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for disableManager
/// </summary>
public class disableManager
{
	public disableManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public List<ExerciseBase> getExercises()
    {
        using (var context = new Layer2Container())
        {
            return context.ExerciseBases.OrderBy(s => s.name).ToList();
        }
    }

    public bool disableExerciseById(int id)
    {
        bool result = true;

        using (var context = new Layer2Container())
        {
            try
            {
                ExerciseBase exercise = context.ExerciseBases.Where(s => s.id == id).FirstOrDefault();
                exercise.enabled = false;
                context.SaveChanges();
            }

            catch (Exception e)
            {
                result = false;
            }

            return result;
        }
    }

    public bool enableExerciseById(int id)
    {
        bool result = true;

        using (var context = new Layer2Container())
        {
            try
            {
                ExerciseBase exercise = context.ExerciseBases.Where(s => s.id == id).FirstOrDefault();
                exercise.enabled = true;
                context.SaveChanges();
            }

            catch (Exception e)
            {
                result = false;
            }

            return result;
        }
    }
}