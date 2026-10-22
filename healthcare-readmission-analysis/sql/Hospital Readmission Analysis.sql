-- Validate my findings using SQL

create database HospitalReadmissionAnalysis;

use HospitalReadmissionAnalysis;

select * from hospital_readmissions_analysis;

select
    count(*) as total_encounters,
    sum(
        case when readmitted = '<30'
             then 1 else 0 end
    ) as readmitted_within_30_days,
    round(
        100.0 * sum(
            case when readmitted = '<30'
                 then 1 else 0 end
        ) / count(*),
        2
    ) as readmission_rate_pct
from hospital_readmissions_analysis;




select
    prior_inpatient_group,
    count(*) as total_encounters,

    round(
        100.0 * sum(
            case
                when readmitted = '<30' then 1
                else 0
            end
        ) / count(*),
        2
    ) as readmission_rate_pct

from (
    select
        case
            when number_inpatient = 0 then '0 visits'
            when number_inpatient = 1 then '1 visit'
            else '2+ visits'
        end as prior_inpatient_group,
        readmitted
    from hospital_readmissions_analysis
) as grouped_data

group by prior_inpatient_group
order by readmission_rate_pct desc;

