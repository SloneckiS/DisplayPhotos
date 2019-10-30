public with sharing class StartScheduleImageCallout
{
    public static void start()
    {
        ScheduleImageCallout imageCallout = new ScheduleImageCallout();
        String sch = '0 31 13 * * ? *';
        String jobID = system.schedule('Retrieve images', sch, imageCallout);
    }
}