package cn.com.konyo.TaskJob;

import java.util.ArrayList;
import java.util.List;

public class DataWorkContext {

    public static List<ScheduleJob> getAllJob() {
        List<ScheduleJob> list = new ArrayList<ScheduleJob>();
        for (int i = 0; i < 5; i++) {
            ScheduleJob job = new ScheduleJob();
            job.setJobId("10001" + i);
            job.setJobName("data_import" + i);
            job.setJobGroup("dataWork");
            job.setJobStatus("1");
            job.setCronExpression("0/5 * * * * ?");
            job.setDesc("数据导入任务");
            list.add(job);
        }
        return list;
    }

}
