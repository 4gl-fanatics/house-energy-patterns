 
 /*------------------------------------------------------------------------
    File        : ClasswithUglyConstructor
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Lutz Fechner
    Created     : Wed Sep 20 00:05:33 CEST 2023
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Consultingwerk.Demo.Decorator.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Consultingwerk.Demo.Factory.ClassWithUglyConstructor IMPLEMENTS IHouse: 
    
    CONSTRUCTOR PUBLIC ClassWithUglyConstructor(pParameter1 AS LOGICAL,
                                                pParameter2 AS LOGICAL,
                                                pParameter3 AS CHARACTER,
                                                pParameter4 AS INTEGER,
                                                pParameter5 AS DECIMAL,
                                                pParameter6 AS INTEGER,
                                                pParameter7 AS LOGICAL,
                                                pParameter8 AS LOGICAL,
                                                pParameter9 AS INTEGER,
                                                pParameter10 AS INTEGER,
                                                pParameter11 AS CHARACTER,
                                                pParameter12 AS LOGICAL,
                                                pParameter113 AS LOGICAL):
    END CONSTRUCTOR. 
    
    CONSTRUCTOR PUBLIC ClassWithUglyConstructor(pParameter1 AS LOGICAL,
                                                pParameter2 AS LOGICAL,
                                                pParameter3 AS CHARACTER,
                                                pParameter4 AS INTEGER,
                                                pParameter5 AS DECIMAL,
                                                pParameter6 AS INTEGER,
                                                pParameter7 AS LOGICAL,
                                                pParameter8 AS LOGICAL,
                                                pParameter9 AS INTEGER,
                                                pParameter10 AS INTEGER,
                                                pParameter11 AS CHARACTER,
                                                pParameter12 AS LOGICAL
                                                ):
    END CONSTRUCTOR.
    
    CONSTRUCTOR PUBLIC ClassWithUglyConstructor(pParameter1 AS LOGICAL,
                                                pParameter2 AS LOGICAL,
                                                pParameter3 AS CHARACTER,
                                                pParameter4 AS INTEGER,
                                                pParameter5 AS DECIMAL,
                                                pParameter6 AS INTEGER,
                                                pParameter7 AS LOGICAL,
                                                pParameter8 AS LOGICAL,
                                                pParameter9 AS INTEGER,
                                                pParameter10 AS INTEGER,
                                                pParameter11 AS CHARACTER):
    END CONSTRUCTOR.
    
    CONSTRUCTOR PUBLIC ClassWithUglyConstructor(pParameter1 AS LOGICAL,
                                                pParameter2 AS LOGICAL,
                                                pParameter3 AS CHARACTER,
                                                pParameter4 AS INTEGER,
                                                pParameter5 AS DECIMAL,
                                                pParameter6 AS INTEGER,
                                                pParameter7 AS LOGICAL,
                                                pParameter8 AS LOGICAL,
                                                pParameter9 AS INTEGER):
    END CONSTRUCTOR.
    
    METHOD PUBLIC INTEGER GetEndEnergyConsumption(  ):
        
        RETURN 25000.

    END METHOD.

END CLASS.