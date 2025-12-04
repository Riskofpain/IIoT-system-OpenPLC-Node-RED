docker cp industrial_plc:/data/programs/programssss.stPROGRAM Projekt_StartStop
  VAR
    MY_START AT %QX0.1 : BOOL;
    MY_STOP AT %QX0.2 : BOOL;
    MY_MOTOR AT %QX0.0 : BOOL;
  END_VAR

  MY_MOTOR := NOT(MY_STOP) AND (MY_MOTOR OR MY_START);
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Projekt_StartStop;
  END_RESOURCE
END_CONFIGURATION
