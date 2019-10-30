public with sharing class StartScheduleImageCallout
{
    public static void start()
    {
        ScheduleImageCallout imageCallout = new ScheduleImageCallout();
        String sch = '0 0 1 * * ? *';
        String jobID = system.schedule('Retrieve images', sch, imageCallout);
    }
}