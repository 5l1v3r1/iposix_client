SELECT FIIDENCABEZADO, 
       FCAPPIMX, 
       FCABREVIATURA, 
       FCDESCRIPCION, 
       FCCAMPOIMX, 
       FINUMORDEN, 
       FCVISORTITULO, 
       FCIMAGEN,
       'OK' AS MSG
FROM DIGWEB.TADGENCABEZADOVISOR 
ORDER BY FINUMORDEN;


SELECT T.EXPIMX,T.APPIMX,T.IMX01,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,('http://10.51.230.89/' || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.APPIMX,X.IMX01,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
                       X.IMX11,X.IMX12,X.IMX13,X.IMX14,X.IMX15,X.IMX16,X.IMX17,X.IMX18,X.IMX19,X.IMX20,
                       X.FCCLIENTEUNICO,X.FDALTA,X.FDMODIFICACION,
                       X2.DOCIMX,X2.IDDOCIMX,X2.NOMDOCIMX,X2.STATUSIMX STATUSIMX2,X2.FISUBPRODUCTO FISUBPRODUCTOX2,
                       X2.FIETAPA FIETAPAX2,
                       X3.PAGIMX,X3.IMGIMX,X3.RUTIMX,X3.STATUSIMX STATUSIMX3,X3.FISUBPRODUCTO FISUBPRODUCTOX3,
                       X3.FIETAPA FIETAPAX3,X3.USUARIOIMX, X3.WSIMX,X3.FECDICIMX,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,'/' || 'img' || '/' || 'digitalizacion_web' || '/',1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,'/' || 'digitalizacion_web' || '/',1) + LENGTH('/' || 'digitalizacion_web' || '/')-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,'/' || 'img' || '/' || 'digitalizacion_web' || '/',1) + LENGTH('/' || 'img' || '/')-1)
                           END
                       )FCRUTAIMG                       
                FROM DIGWEB.IMX03 X3 INNER JOIN DIGWEB.IMX02 X2 
                                             ON X3.APPIMX = X2.APPIMX
                                            AND X3.EXPIMX = X2.EXPIMX
                                            AND X3.DOCIMX = X2.DOCIMX
                                            AND X3.FISUBPRODUCTO = X2.FISUBPRODUCTO
                                            AND X3.FIETAPA = X2.FIETAPA
                                 INNER JOIN DIGWEB.IMX01 X
                                             ON X.APPIMX = X2.APPIMX
                                            AND X.EXPIMX = X2.EXPIMX     
                WHERE X.APPIMX = 'OPERACAPTA' --'CAPTACION_WEB'
                  AND X.IMX01 = '1-51-5997-3915-1-51-5997-3915-8488'   
                  AND X2.STATUSIMX <> 0
                  AND X3.STATUSIMX <> 0                    
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX; 

SELECT *
FROM DIGWEB.DIG_UNIDAD_VOLUMEN;


select *
from DIGBB.TADG_OPERACAPTA;

-- 1-51-5997-3915-1-51-5997-3915-8488

-- pais-canal-sucursal-folio-foliomatenimiento-sucurdal_dig

SELECT *
FROM DIGWEB.IMX03 X3
WHERE X3.EXPIMX = 12
;
SELECT FIIDENCABEZADO, FCAPPIMX, FCABREVIATURA, FCDESCRIPCION, FCCAMPOIMX, FINUMORDEN, FCVISORTITULO, FCIMAGEN,'OK' AS MSG
           FROM DIGWEB.TADGENCABEZADOVISOR 
           WHERE  FIIDENCABEZADO= 2
           order by FINUMORDEN;















