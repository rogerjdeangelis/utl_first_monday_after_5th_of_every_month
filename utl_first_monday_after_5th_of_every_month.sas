First monday after 5th of every month

Same result in SAS and WPS

github
https://github.com/rogerjdeangelis/utl_first_monday_after_5th_of_every_month

see
https://tinyurl.com/y7o3bhxl
https://communities.sas.com/t5/Base-SAS-Programming/how-to-find-the-first-monday-after-5th-of-every-month/m-p/472871

Arunasaran profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/32726


INPUT
=====                 |  RULE
                      |
           CURRDATE   |  First monday after 5th of every month
                      |
   Mon, Jan 1, 2018   |
   Tue, Jan 2, 2018   |
   Wed, Jan 3, 2018   |
   Thu, Jan 4, 2018   |
   Fri, Jan 5, 2018   |  Mon, Jan 8, 2018
                      |
   Thu, Feb 1, 2018   |
   Fri, Feb 2, 2018   |
   Sat, Feb 3, 2018   |
   Sun, Feb 4, 2018   |
   Mon, Feb 5, 2018   |  Mon, Feb 5, 2018
                      |
   Thu, Mar 1, 2018   |
   Fri, Mar 2, 2018   |
   Sat, Mar 3, 2018   |
   Sun, Mar 4, 2018   |
   Mon, Mar 5, 2018   |  Mon, Mar 5, 2018
                      |
   Sun, Apr 1, 2018   |
   Mon, Apr 2, 2018   |
   Tue, Apr 3, 2018   |
   Wed, Apr 4, 2018   |
   Thu, Apr 5, 2018   |  Mon, Apr 9, 2018
                      |
   Tue, May 1, 2018   |
   Wed, May 2, 2018   |
   Thu, May 3, 2018   |
   Fri, May 4, 2018   |
   Sat, May 5, 2018   |  Mon, May 7, 2018
                      |
   Fri, Jun 1, 2018   |
   Sat, Jun 2, 2018   |
   Sun, Jun 3, 2018   |
   Mon, Jun 4, 2018   |
   Tue, Jun 5, 2018   | Mon, Jun 11, 2018


PROCESS
=======

data want;
  format currdate rundate MondayAft1st weekdate17.;
  do currdate='01jan2018'd to today();
    MondayAft1st=intnx('week.3',intnx('month',currdate,0,'b')+4,0,'e');
    rundate=ifn(currdate>MondayAft1st,intnx('week.3',intnx('month',currdate,1,'b')+4,0,'e'),MondayAft1st);
    if day(currdate) <= 5 then output;
  end;
  stop;
run;quit;

OUTPUT
======

 WORK.WANT total obs=30

            CURRDATE              RUNDATE         MONDAYAFT1ST

    Mon, Jan 1, 2018     Mon, Jan 8, 2018     Mon, Jan 8, 2018
    Tue, Jan 2, 2018     Mon, Jan 8, 2018     Mon, Jan 8, 2018
    Wed, Jan 3, 2018     Mon, Jan 8, 2018     Mon, Jan 8, 2018
    Thu, Jan 4, 2018     Mon, Jan 8, 2018     Mon, Jan 8, 2018
    Fri, Jan 5, 2018     Mon, Jan 8, 2018     Mon, Jan 8, 2018

    Thu, Feb 1, 2018     Mon, Feb 5, 2018     Mon, Feb 5, 2018
    Fri, Feb 2, 2018     Mon, Feb 5, 2018     Mon, Feb 5, 2018
    Sat, Feb 3, 2018     Mon, Feb 5, 2018     Mon, Feb 5, 2018
    Sun, Feb 4, 2018     Mon, Feb 5, 2018     Mon, Feb 5, 2018
    Mon, Feb 5, 2018     Mon, Feb 5, 2018     Mon, Feb 5, 2018

    Thu, Mar 1, 2018     Mon, Mar 5, 2018     Mon, Mar 5, 2018
    Fri, Mar 2, 2018     Mon, Mar 5, 2018     Mon, Mar 5, 2018
    Sat, Mar 3, 2018     Mon, Mar 5, 2018     Mon, Mar 5, 2018
    Sun, Mar 4, 2018     Mon, Mar 5, 2018     Mon, Mar 5, 2018
    Mon, Mar 5, 2018     Mon, Mar 5, 2018     Mon, Mar 5, 2018

    Sun, Apr 1, 2018     Mon, Apr 9, 2018     Mon, Apr 9, 2018
    Mon, Apr 2, 2018     Mon, Apr 9, 2018     Mon, Apr 9, 2018
    Tue, Apr 3, 2018     Mon, Apr 9, 2018     Mon, Apr 9, 2018
    Wed, Apr 4, 2018     Mon, Apr 9, 2018     Mon, Apr 9, 2018
    Thu, Apr 5, 2018     Mon, Apr 9, 2018     Mon, Apr 9, 2018

    Tue, May 1, 2018     Mon, May 7, 2018     Mon, May 7, 2018
    Wed, May 2, 2018     Mon, May 7, 2018     Mon, May 7, 2018
    Thu, May 3, 2018     Mon, May 7, 2018     Mon, May 7, 2018
    Fri, May 4, 2018     Mon, May 7, 2018     Mon, May 7, 2018
    Sat, May 5, 2018     Mon, May 7, 2018     Mon, May 7, 2018

    Fri, Jun 1, 2018    Mon, Jun 11, 2018    Mon, Jun 11, 2018
    Sat, Jun 2, 2018    Mon, Jun 11, 2018    Mon, Jun 11, 2018
    Sun, Jun 3, 2018    Mon, Jun 11, 2018    Mon, Jun 11, 2018
    Mon, Jun 4, 2018    Mon, Jun 11, 2018    Mon, Jun 11, 2018
    Tue, Jun 5, 2018    Mon, Jun 11, 2018    Mon, Jun 11, 2018


*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

data want;
  format currdate rundate MondayAft1st weekdate17.;
  do currdate='01jan2018'd to today();
    MondayAft1st=intnx('week.3',intnx('month',currdate,0,'b')+4,0,'e');
    rundate=ifn(currdate>MondayAft1st,intnx('week.3',intnx('month',currdate,1,'b')+4,0,'e'),MondayAft1st);
    if day(currdate) <= 5 then output;
  end;
  stop;
run;quit;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;


%utl_submit_wps64('
libname wrk sas7bdat "%sysfunc(pathname(work))";
data wrk.wantwps;
  format currdate rundate MondayAft1st weekdate17.;
  do currdate="01jan2018"d to today();
    MondayAft1st=intnx("week.3",intnx("month",currdate,0,"b")+4,0,"e");
    rundate=ifn(currdate>MondayAft1st,intnx("week.3",intnx("month",currdate,1,"b")+4,0,"e"),MondayAft1st);
    if day(currdate) <= 5 then output;
  end;
  stop;
run;quit;
');

