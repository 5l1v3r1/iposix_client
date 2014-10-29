--
-- Create Schema Script 
--   Database Version   : 11.2.0.2.0 
--   Toad Version       : 10.5.1.3 
--   DB Connect String  : DIGBDP1 
--   Schema             : DIGWEB 
--   Script Created by  : HQUEZADA 
--   Script Created at  : 10/10/2014 21:44:37 
--   Physical Location  :  
--   Notes              :  
--

-- Object Counts: 
--   Directories: 0 
--   Functions: 42      Lines of Code: 4984 
--   Indexes: 53        Columns: 96         
--   Object Privileges: 100 
--   Packages: 26       Lines of Code: 984 
--   Package Bodies: 25 Lines of Code: 7554 
--   Procedures: 6      Lines of Code: 430 
--   Tables: 38         Columns: 266        Constraints: 34     


--
-- CATDESCDOCUMENTOS  (Table) 
--
CREATE TABLE DIGWEB.CATDESCDOCUMENTOS
(
  FIIDDOCUMENTO          INTEGER                NOT NULL,
  FCDESCDOCUMENTO        CHAR(50 BYTE)              NULL,
  FCDESCCORTA            CHAR(20 BYTE)              NULL,
  FCPROPIETARIO          VARCHAR2(50 BYTE)          NULL,
  FCORIGENDOCTO          VARCHAR2(50 BYTE)          NULL,
  FDFECULTACTUALIZACION  DATE                       NULL,
  FCEMPACTUALIZA         CHAR(10 BYTE)              NULL,
  FIDOCSUCID             NUMBER                     NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CATDIGSCANNER  (Table) 
--
CREATE TABLE DIGWEB.CATDIGSCANNER
(
  FIIDSCANNER          NUMBER                   NOT NULL,
  FCDESCRIPCION        VARCHAR2(64 BYTE)        NOT NULL,
  FCMODELO             VARCHAR2(64 BYTE)        NOT NULL,
  FCFABRICANTE         VARCHAR2(64 BYTE)            NULL,
  ACTIVO               NUMBER                       NULL,
  ULTIMA_MODIFICACION  DATE                         NULL,
  USUARIO              VARCHAR2(30 BYTE)            NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CATDIGTEMPLATE  (Table) 
--
CREATE TABLE DIGWEB.CATDIGTEMPLATE
(
  FIIDTEMPLATE         NUMBER                   NOT NULL,
  FIIDSCANNER          NUMBER                   NOT NULL,
  FCDESCRIPCION        VARCHAR2(64 BYTE)        NOT NULL,
  FIVERSION            NUMBER                   NOT NULL,
  FDCREACION           DATE                     NOT NULL,
  ACTIVO               NUMBER                       NULL,
  FCDFBCATA            VARCHAR2(128 BYTE)           NULL,
  ULTIMA_MODIFICACION  DATE                         NULL,
  USUARIO              VARCHAR2(30 BYTE)            NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CATDOCIDIOMA  (Table) 
--
CREATE TABLE DIGWEB.CATDOCIDIOMA
(
  IDMSJ           INTEGER                       NOT NULL,
  IDIDIOMA        INTEGER                           NULL,
  FCDESCDOCTOESP  VARCHAR2(200 BYTE)                NULL,
  FCDESCDOCTOTRA  VARCHAR2(200 BYTE)                NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CATDOCIMAX  (Table) 
--
CREATE TABLE DIGWEB.CATDOCIMAX
(
  FCPRODUCTO           VARCHAR2(50 BYTE)        NOT NULL,
  FIIDDIGWEB           INTEGER                  NOT NULL,
  FCDESCDOCUMENTO      VARCHAR2(50 BYTE)        NOT NULL,
  FIIDIMAX             INTEGER                  NOT NULL,
  FISTATUS             INTEGER                      NULL,
  FDFECHACTUALIZACION  DATE                         NULL,
  FCUSUARIO            VARCHAR2(38 BYTE)            NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CATDOCUMENTOS  (Table) 
--
CREATE TABLE DIGWEB.CATDOCUMENTOS
(
  FIOPEDOCUMENTO         INTEGER                NOT NULL,
  FIIDDOCUMENTO          INTEGER                NOT NULL,
  FCDESCDOCUMENTO        CHAR(50 BYTE)              NULL,
  FCDESCCORTA            CHAR(20 BYTE)              NULL,
  FDFECULTACTUALIZACION  DATE                       NULL,
  FCEMPACTUALIZA         CHAR(10 BYTE)              NULL,
  FISTATUS               INTEGER                    NULL,
  FIAGREGAPAG            INTEGER                    NULL,
  FIETAPA                NUMBER(2)              DEFAULT 0                         NULL,
  FISUBPRODUCTO          NUMBER                 DEFAULT 0                         NULL,
  FIIDTABLA              NUMBER(3)              DEFAULT 1                     NOT NULL,
  FIORDER                NUMBER(3)              DEFAULT 0                     NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CATDOCUMENTOSTMP  (Table) 
--
CREATE TABLE DIGWEB.CATDOCUMENTOSTMP
(
  FIOPEDOCUMENTO         INTEGER                NOT NULL,
  FIIDDOCUMENTO          INTEGER                NOT NULL,
  FCDESCDOCUMENTO        CHAR(50 BYTE)              NULL,
  FCDESCCORTA            CHAR(20 BYTE)              NULL,
  FDFECULTACTUALIZACION  DATE                       NULL,
  FCEMPACTUALIZA         CHAR(10 BYTE)              NULL,
  FISTATUS               INTEGER                    NULL,
  FIAGREGAPAG            INTEGER                    NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CATIDIOMA  (Table) 
--
CREATE TABLE DIGWEB.CATIDIOMA
(
  IDIDIOMA  INTEGER                             NOT NULL,
  IDIOMA    VARCHAR2(20 BYTE)                       NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CATOPERADOCTOS  (Table) 
--
CREATE TABLE DIGWEB.CATOPERADOCTOS
(
  FIOPEDOCUMENTO         INTEGER                NOT NULL,
  FCDESCOPERADOCTO       CHAR(50 BYTE)              NULL,
  FCDESCCORTA            CHAR(20 BYTE)              NULL,
  FDFECULTACTUALIZACION  DATE                       NULL,
  FCEMPACTUALIZA         CHAR(10 BYTE)              NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- CAT_IP  (Table) 
--
CREATE TABLE DIGWEB.CAT_IP
(
  FIFROMIP       NUMBER                             NULL,
  FCIP_SCANER    VARCHAR2(128 BYTE)                 NULL,
  FCIP_SERVELET  VARCHAR2(128 BYTE)                 NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- DESCHEADERS  (Table) 
--
CREATE TABLE DIGWEB.DESCHEADERS
(
  IDTABLA     NUMBER                            NOT NULL,
  DESCTITULO  VARCHAR2(40 BYTE)                 NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- DESC_LOG  (Table) 
--
CREATE TABLE DIGWEB.DESC_LOG
(
  ID_DESC      NUMBER                           NOT NULL,
  DESCRIPCION  VARCHAR2(200 BYTE)                   NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- DIGSCANTMPL  (Table) 
--
CREATE TABLE DIGWEB.DIGSCANTMPL
(
  FIIDTEMPLATE         NUMBER                   NOT NULL,
  FIIDSCANNER          NUMBER                   NOT NULL,
  FIOPEDOCUMENTO       NUMBER                   NOT NULL,
  ULTIMA_MODIFICACION  DATE                         NULL,
  USUARIO              VARCHAR2(30 BYTE)            NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- DIG_UNIDAD_VOLUMEN  (Table) 
--
CREATE TABLE DIGWEB.DIG_UNIDAD_VOLUMEN
(
  UNIDAD            CHAR(3 BYTE)                NOT NULL,
  RUTA_BASE         VARCHAR2(16 BYTE)           NOT NULL,
  ESTADO_UNIDAD     NUMBER                      NOT NULL,
  TIPO_DISPOSITIVO  CHAR(1 BYTE)                NOT NULL,
  FCALIAS           VARCHAR2(50 BYTE)               NULL,
  FCRUTASOL         VARCHAR2(64 BYTE)               NULL,
  FISTATUS          NUMBER                          NULL,
  FCALIASSAMBA      VARCHAR2(32 BYTE)               NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- DOCTOSBASE  (Table) 
--
CREATE TABLE DIGWEB.DOCTOSBASE
(
  FIOPEDOCUMENTO  INTEGER                       NOT NULL,
  FIDDOCUMENTO    INTEGER                       NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- ENCABEZADO  (Table) 
--
CREATE TABLE DIGWEB.ENCABEZADO
(
  APPIMX  VARCHAR2(16 BYTE)                     NOT NULL,
  RUTA    VARCHAR2(100 BYTE)                    NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- ENCABIMX  (Table) 
--
CREATE TABLE DIGWEB.ENCABIMX
(
  ID       NUMBER                               NOT NULL,
  APPIMX   VARCHAR2(64 BYTE)                    NOT NULL,
  IMX      VARCHAR2(5 BYTE)                     NOT NULL,
  DESCIMX  VARCHAR2(200 BYTE)                   NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- ENVEXP  (Table) 
--
CREATE TABLE DIGWEB.ENVEXP
(
  APPIMX  VARCHAR2(64 BYTE)                         NULL,
  URL     VARCHAR2(300 BYTE)                        NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- ENVEXPPARAM  (Table) 
--
CREATE TABLE DIGWEB.ENVEXPPARAM
(
  APPIMX     VARCHAR2(64 BYTE)                      NULL,
  PARAMETRO  VARCHAR2(64 BYTE)                      NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- ENVEXPTER  (Table) 
--
CREATE TABLE DIGWEB.ENVEXPTER
(
  APPIMX  VARCHAR2(64 BYTE)                     NOT NULL,
  URL     VARCHAR2(300 BYTE)                    NOT NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- IMX01  (Table) 
--
CREATE TABLE DIGWEB.IMX01
(
  APPIMX          CHAR(16 BYTE)                 NOT NULL,
  EXPIMX          INTEGER                       NOT NULL,
  USOIMX          CHAR(1 BYTE)                  NOT NULL,
  EDOIMX          CHAR(1 BYTE)                  NOT NULL,
  IMX01           VARCHAR2(64 BYTE)             NOT NULL,
  IMX02           VARCHAR2(64 BYTE)                 NULL,
  IMX03           VARCHAR2(64 BYTE)                 NULL,
  IMX04           VARCHAR2(64 BYTE)                 NULL,
  IMX05           VARCHAR2(64 BYTE)                 NULL,
  IMX06           VARCHAR2(64 BYTE)                 NULL,
  IMX07           VARCHAR2(64 BYTE)                 NULL,
  IMX08           VARCHAR2(64 BYTE)                 NULL,
  IMX09           VARCHAR2(64 BYTE)                 NULL,
  IMX10           VARCHAR2(64 BYTE)                 NULL,
  STATIMAX        NUMBER(1)                         NULL,
  IMX11           VARCHAR2(64 BYTE)                 NULL,
  IMX12           VARCHAR2(64 BYTE)                 NULL,
  IMX13           VARCHAR2(64 BYTE)                 NULL,
  IMX14           VARCHAR2(64 BYTE)                 NULL,
  IMX15           VARCHAR2(64 BYTE)                 NULL,
  IMX16           VARCHAR2(64 BYTE)                 NULL,
  IMX17           VARCHAR2(64 BYTE)                 NULL,
  IMX18           VARCHAR2(64 BYTE)                 NULL,
  IMX19           VARCHAR2(64 BYTE)                 NULL,
  IMX20           VARCHAR2(64 BYTE)                 NULL,
  FCCLIENTEUNICO  VARCHAR2(64 BYTE)                 NULL,
  FIDOMICILIA     NUMBER(2)                     DEFAULT 0                         NULL,
  FISUCURSALDOM   NUMBER                            NULL,
  FDALTA          DATE                              NULL,
  FDMODIFICACION  DATE                              NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- IMX02  (Table) 
--
CREATE TABLE DIGWEB.IMX02
(
  APPIMX         CHAR(16 BYTE)                  NOT NULL,
  EXPIMX         INTEGER                        NOT NULL,
  DOCIMX         INTEGER                        NOT NULL,
  IDDOCIMX       INTEGER                        NOT NULL,
  NOMDOCIMX      CHAR(64 BYTE)                  NOT NULL,
  STATUSIMX      NUMBER(2)                          NULL,
  FISUBPRODUCTO  NUMBER                             NULL,
  FIETAPA        NUMBER(2)                          NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- IMX03  (Table) 
--
CREATE TABLE DIGWEB.IMX03
(
  APPIMX         CHAR(16 BYTE)                  NOT NULL,
  EXPIMX         INTEGER                        NOT NULL,
  DOCIMX         INTEGER                        NOT NULL,
  PAGIMX         INTEGER                        NOT NULL,
  IMGIMX         CHAR(256 BYTE)                 NOT NULL,
  RUTIMX         VARCHAR2(512 BYTE)             NOT NULL,
  STATUSIMX      NUMBER(2)                          NULL,
  FISUBPRODUCTO  NUMBER                             NULL,
  FIETAPA        NUMBER(2)                          NULL,
  USUARIOIMX     VARCHAR2(20 BYTE)                  NULL,
  WSIMX          VARCHAR2(20 BYTE)                  NULL,
  FECDICIMX      DATE                               NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- LOGS_DIGITALIZA  (Table) 
--
CREATE TABLE DIGWEB.LOGS_DIGITALIZA
(
  USUARIO   VARCHAR2(20 BYTE)                       NULL,
  PRODUCTO  VARCHAR2(20 BYTE)                       NULL,
  FECHA     DATE                                    NULL,
  PC_NAME   VARCHAR2(20 BYTE)                       NULL,
  DIR_IP    VARCHAR2(20 BYTE)                       NULL,
  DOMINIO   VARCHAR2(30 BYTE)                       NULL,
  ID_DESC   NUMBER                                  NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- ORDERDOCS  (Table) 
--
CREATE TABLE DIGWEB.ORDERDOCS
(
  ORDERDOC        NUMBER(2)                     NOT NULL,
  FIOPEDOCUMENTO  INTEGER                       NOT NULL,
  FIETAPA         NUMBER(2)                     NOT NULL,
  FISUBPRODUCTO   NUMBER                        NOT NULL,
  FIDDOCUMENTO    INTEGER                           NULL,
  IDTABLA         NUMBER(3)                         NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- ORDERDOCS_BKP13112008  (Table) 
--
CREATE TABLE DIGWEB.ORDERDOCS_BKP13112008
(
  ORDERDOC        NUMBER(2)                     NOT NULL,
  FIOPEDOCUMENTO  INTEGER                       NOT NULL,
  FIETAPA         NUMBER(2)                     NOT NULL,
  FISUBPRODUCTO   NUMBER(3)                     NOT NULL,
  FIDDOCUMENTO    INTEGER                           NULL,
  IDTABLA         NUMBER(3)                         NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- RESULTADO  (Table) 
--
CREATE TABLE DIGWEB.RESULTADO
(
  RES    VARCHAR2(50 BYTE)                          NULL,
  LLAVE  VARCHAR2(50 BYTE)                          NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- TADGBITACORACHEQUEMOVIL  (Table) 
--
CREATE TABLE DIGWEB.TADGBITACORACHEQUEMOVIL
(
  FCPRODUCTO       VARCHAR2(30 BYTE)            NOT NULL,
  FCBANDACHQ       VARCHAR2(50 BYTE)            NOT NULL,
  FCSERIAL         NUMBER                       NOT NULL,
  FCTIPOCHEQUE     VARCHAR2(30 BYTE)            NOT NULL,
  FCIDDOCUMENTO    VARCHAR2(30 BYTE)                NULL,
  FCPAIS           VARCHAR2(30 BYTE)                NULL,
  FCCANAL          VARCHAR2(30 BYTE)                NULL,
  FCSUCURSAL       VARCHAR2(30 BYTE)                NULL,
  FCOPCIONCHQ      VARCHAR2(200 BYTE)               NULL,
  FCCUENTACARGO    VARCHAR2(20 BYTE)                NULL,
  FCCUENTAABONO    VARCHAR2(20 BYTE)                NULL,
  FCIMPORTE        VARCHAR2(30 BYTE)                NULL,
  FCNUMEROCHQ      VARCHAR2(20 BYTE)                NULL,
  FCFECHAOP        VARCHAR2(30 BYTE)                NULL,
  FCDIVISA         VARCHAR2(20 BYTE)                NULL,
  FCCODIGO         VARCHAR2(20 BYTE)                NULL,
  FCTIPOBFC        VARCHAR2(30 BYTE)                NULL,
  FCREFPAGO        VARCHAR2(50 BYTE)                NULL,
  FCNUMRTC         VARCHAR2(50 BYTE)                NULL,
  FCHORAOP         VARCHAR2(10 BYTE)                NULL,
  FCIMX18          VARCHAR2(30 BYTE)                NULL,
  FCIMX19          VARCHAR2(30 BYTE)                NULL,
  FCIMX20          VARCHAR2(30 BYTE)                NULL,
  FCEXTENSIONIMG   VARCHAR2(30 BYTE)                NULL,
  FCUSUARIO        VARCHAR2(30 BYTE)                NULL,
  FCWORKSTATION    VARCHAR2(30 BYTE)                NULL,
  FCIDSUBPRODUCTO  VARCHAR2(30 BYTE)                NULL,
  FCIDETAPA        VARCHAR2(30 BYTE)                NULL,
  FCENVIAIMAGEN    VARCHAR2(30 BYTE)                NULL,
  FCEDOIMX         VARCHAR2(30 BYTE)                NULL,
  FCTIPOEXT        VARCHAR2(30 BYTE)                NULL,
  FCVERIFICA       VARCHAR2(32 BYTE)                NULL,
  FCMENSAJE        VARCHAR2(2000 BYTE)              NULL,
  FDALTA           DATE                         NOT NULL,
  FDMODIFICACION   DATE                         NOT NULL
)
TABLESPACE DIGCEN_DATA02_DAT
/


--
-- TADGDATOSPAD  (Table) 
--
CREATE TABLE DIGWEB.TADGDATOSPAD
(
  FIIDREG         NUMBER                        NOT NULL,
  FINOPAG         NUMBER                        NOT NULL,
  FIEXPIMX        NUMBER                            NULL,
  FISOLICITUD     NUMBER                        NOT NULL,
  FCDESCCAMPO     VARCHAR2(50 BYTE)             NOT NULL,
  FCRUTAIMAGEN    VARCHAR2(200 BYTE)                NULL,
  FCTEXTO         VARCHAR2(200 BYTE)                NULL,
  FISTATUS        NUMBER                        NOT NULL,
  FDFECHAALTA     DATE                          NOT NULL,
  FDMODIFICACION  DATE                          NOT NULL,
  FCUSRMODIFICO   VARCHAR2(30 BYTE)             NOT NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- TADGENCABEZADOVISOR  (Table) 
--
CREATE TABLE DIGWEB.TADGENCABEZADOVISOR
(
  FIIDENCABEZADO  NUMBER                        NOT NULL,
  FCAPPIMX        VARCHAR2(16 BYTE)             NOT NULL,
  FISERIAL        NUMBER                        NOT NULL,
  FCABREVIATURA   VARCHAR2(5 BYTE)              NOT NULL,
  FCDESCRIPCION   VARCHAR2(40 BYTE)             NOT NULL,
  FCCAMPOIMX      VARCHAR2(15 BYTE)             NOT NULL,
  FINUMORDEN      NUMBER                        NOT NULL,
  FCVISORTITULO   VARCHAR2(40 BYTE)             NOT NULL,
  FCIMAGEN        VARCHAR2(30 BYTE)             NOT NULL,
  FDALTA          DATE                          NOT NULL,
  FDMODIFICACION  DATE                              NULL,
  FCUSRMODIFICO   VARCHAR2(32 BYTE)             NOT NULL
)
TABLESPACE DIGCEN_DATA02_DAT
/


--
-- TASERVCOLUMN  (Table) 
--
CREATE TABLE DIGWEB.TASERVCOLUMN
(
  FCDESCSERV      VARCHAR2(64 BYTE)             NOT NULL,
  FCCLUMNA        VARCHAR2(5 BYTE)              NOT NULL,
  FCTIPOCOLUMNA   VARCHAR2(1 BYTE)              NOT NULL,
  FCCORRESP_IMAX  VARCHAR2(30 BYTE)                 NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- TASERVICIOSDG  (Table) 
--
CREATE TABLE DIGWEB.TASERVICIOSDG
(
  FCDESCSERV  VARCHAR2(64 BYTE)                 NOT NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- TCCATCONTRATOS  (Table) 
--
CREATE TABLE DIGWEB.TCCATCONTRATOS
(
  FIIDREG          NUMBER                       NOT NULL,
  FCPRODUCTO       VARCHAR2(50 BYTE)            NOT NULL,
  FIIDCONTRATO     NUMBER                       NOT NULL,
  FCIDCONTRATO     VARCHAR2(38 BYTE)            NOT NULL,
  FCLLAVECONTRATO  VARCHAR2(50 BYTE)                NULL,
  FDFECHAALTA      DATE                         NOT NULL,
  FDMODIFICACION   DATE                         NOT NULL,
  FCUSRMODIFICO    VARCHAR2(30 BYTE)            NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- TCCATCORDENADAS  (Table) 
--
CREATE TABLE DIGWEB.TCCATCORDENADAS
(
  FIIDREG         NUMBER                        NOT NULL,
  FINOPAG         NUMBER                        NOT NULL,
  FCDESCCAMPO     VARCHAR2(50 BYTE)             NOT NULL,
  FCCORDIMAGEN    VARCHAR2(200 BYTE)                NULL,
  FCCORDTEXTO     VARCHAR2(200 BYTE)                NULL,
  FDFECHAALTA     DATE                          NOT NULL,
  FDMODIFICACION  DATE                          NOT NULL,
  FCUSRMODIFICO   VARCHAR2(30 BYTE)             NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- TCCATDETCONTRATOS  (Table) 
--
CREATE TABLE DIGWEB.TCCATDETCONTRATOS
(
  FIIDREG         NUMBER                        NOT NULL,
  FINOPAG         NUMBER                        NOT NULL,
  FCRUTAIMAGEN    VARCHAR2(200 BYTE)            NOT NULL,
  FCDESC          VARCHAR2(50 BYTE)                 NULL,
  FDFECHAALTA     DATE                          NOT NULL,
  FDMODIFICACION  DATE                          NOT NULL,
  FCUSRMODIFICO   VARCHAR2(30 BYTE)             NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- TCDGCHQDEV  (Table) 
--
CREATE TABLE DIGWEB.TCDGCHQDEV
(
  FIIDCAUSA       NUMBER                        NOT NULL,
  FCDESCRIPCION   VARCHAR2(128 BYTE)            NOT NULL,
  FIESTATUS       NUMBER                        NOT NULL,
  FDALTA          DATE                          NOT NULL,
  FDMODIFICACION  DATE                          NOT NULL,
  FCUSRMODIFICO   VARCHAR2(32 BYTE)             NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- TCDGTERMINALCHQMOVIL  (Table) 
--
CREATE TABLE DIGWEB.TCDGTERMINALCHQMOVIL
(
  FIIDTERMINAL    NUMBER                        NOT NULL,
  FCTERMINAL      VARCHAR2(30 BYTE)             NOT NULL,
  FCESTATUS       VARCHAR2(30 BYTE)             NOT NULL,
  FDALTA          DATE                          NOT NULL,
  FDMODIFICACION  DATE                          NOT NULL
)
TABLESPACE TBS_DIGWB_CATALOG_DAT
/


--
-- UNIDADES  (Table) 
--
CREATE TABLE DIGWEB.UNIDADES
(
  FCUNIDAD   VARCHAR2(1 BYTE)                   NOT NULL,
  FCEQUVALE  VARCHAR2(100 BYTE)                     NULL
)
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- CATDOCIDIOMA_PK  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.CATDOCIDIOMA_PK ON DIGWEB.CATDOCIDIOMA
(IDMSJ)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- CATIDIOMA_PK  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.CATIDIOMA_PK ON DIGWEB.CATIDIOMA
(IDIDIOMA)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- IDX001IMX01  (Index) 
--
CREATE INDEX DIGWEB.IDX001IMX01 ON DIGWEB.IMX01
(IMX01)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IDX001TADGDATOSPAD  (Index) 
--
CREATE INDEX DIGWEB.IDX001TADGDATOSPAD ON DIGWEB.TADGDATOSPAD
(FIIDREG, FINOPAG, FISOLICITUD)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IDX001TCCATCORDENADAS  (Index) 
--
CREATE INDEX DIGWEB.IDX001TCCATCORDENADAS ON DIGWEB.TCCATCORDENADAS
(FIIDREG, FINOPAG)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IDX002CATOPERADOCTOS  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IDX002CATOPERADOCTOS ON DIGWEB.CATOPERADOCTOS
(FCDESCOPERADOCTO)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IDX002IMX01  (Index) 
--
CREATE INDEX DIGWEB.IDX002IMX01 ON DIGWEB.IMX01
(FCCLIENTEUNICO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IDX002TADGDATOSPAD  (Index) 
--
CREATE INDEX DIGWEB.IDX002TADGDATOSPAD ON DIGWEB.TADGDATOSPAD
(FISTATUS)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IDX1TADGDATOSPAD  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IDX1TADGDATOSPAD ON DIGWEB.TADGDATOSPAD
(FIIDREG, FINOPAG, FISOLICITUD, FCDESCCAMPO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IDX1TCCATCONTRATOS  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IDX1TCCATCONTRATOS ON DIGWEB.TCCATCONTRATOS
(FCPRODUCTO, FIIDCONTRATO, FCIDCONTRATO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IDX1TCCATCORDENADAS  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IDX1TCCATCORDENADAS ON DIGWEB.TCCATCORDENADAS
(FIIDREG, FINOPAG, FCDESCCAMPO)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IDX1TCCATDETCONTRATOS  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IDX1TCCATDETCONTRATOS ON DIGWEB.TCCATDETCONTRATOS
(FIIDREG, FINOPAG)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IX0001ENCABEZADOVISOR  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IX0001ENCABEZADOVISOR ON DIGWEB.TADGENCABEZADOVISOR
(FIIDENCABEZADO, FISERIAL)
NOLOGGING
TABLESPACE DIGCEN_DATA02_IDX
/


--
-- IX0002ENCABEZADOVISOR  (Index) 
--
CREATE INDEX DIGWEB.IX0002ENCABEZADOVISOR ON DIGWEB.TADGENCABEZADOVISOR
(FCAPPIMX)
NOLOGGING
TABLESPACE DIGCEN_DATA02_IDX
/


--
-- IX001BITACORACHEQUEMOVIL  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IX001BITACORACHEQUEMOVIL ON DIGWEB.TADGBITACORACHEQUEMOVIL
(FCPRODUCTO, FCBANDACHQ, FCSERIAL)
NOLOGGING
TABLESPACE DIGCEN_DATA02_IDX
/


--
-- IX001TCCATCONTRATOS  (Index) 
--
CREATE INDEX DIGWEB.IX001TCCATCONTRATOS ON DIGWEB.TCCATCONTRATOS
(FCLLAVECONTRATO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IX001TCCATDETCONTRATOS  (Index) 
--
CREATE INDEX DIGWEB.IX001TCCATDETCONTRATOS ON DIGWEB.TCCATDETCONTRATOS
(FIIDREG)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IX001TCDGTERMINALCHQMOVIL  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IX001TCDGTERMINALCHQMOVIL ON DIGWEB.TCDGTERMINALCHQMOVIL
(FIIDTERMINAL, FCTERMINAL)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IX002BITACORACHEQUEMOVIL  (Index) 
--
CREATE INDEX DIGWEB.IX002BITACORACHEQUEMOVIL ON DIGWEB.TADGBITACORACHEQUEMOVIL
(FCTIPOCHEQUE)
NOLOGGING
TABLESPACE DIGCEN_DATA02_IDX
/


--
-- IX002TCCATCONTRATOS  (Index) 
--
CREATE INDEX DIGWEB.IX002TCCATCONTRATOS ON DIGWEB.TCCATCONTRATOS
(FIIDREG)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IX002TCDGTERMINALCHQMOVIL  (Index) 
--
CREATE INDEX DIGWEB.IX002TCDGTERMINALCHQMOVIL ON DIGWEB.TCDGTERMINALCHQMOVIL
(FCESTATUS)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IX003BITACORACHEQUEMOVIL  (Index) 
--
CREATE INDEX DIGWEB.IX003BITACORACHEQUEMOVIL ON DIGWEB.TADGBITACORACHEQUEMOVIL
(FCIMPORTE)
NOLOGGING
TABLESPACE DIGCEN_DATA02_IDX
/


--
-- IX004BITACORACHEQUEMOVIL  (Index) 
--
CREATE INDEX DIGWEB.IX004BITACORACHEQUEMOVIL ON DIGWEB.TADGBITACORACHEQUEMOVIL
(FDALTA)
NOLOGGING
TABLESPACE DIGCEN_DATA02_IDX
/


--
-- IX01DIGUNIDADVOLUMEN  (Index) 
--
CREATE INDEX DIGWEB.IX01DIGUNIDADVOLUMEN ON DIGWEB.DIG_UNIDAD_VOLUMEN
(ESTADO_UNIDAD)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IX01TCDGCHQDEV  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IX01TCDGCHQDEV ON DIGWEB.TCDGCHQDEV
(FIIDCAUSA)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IX02DIGUNIDADVOLUMEN  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IX02DIGUNIDADVOLUMEN ON DIGWEB.DIG_UNIDAD_VOLUMEN
(FCRUTASOL)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IX02TCDGCHQDEV  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.IX02TCDGCHQDEV ON DIGWEB.TCDGCHQDEV
(FCDESCRIPCION)
NOLOGGING
TABLESPACE TBS_DIGWB_CATALOG_IDX
/


--
-- IX03IMX01  (Index) 
--
CREATE INDEX DIGWEB.IX03IMX01 ON DIGWEB.IMX01
(EDOIMX, USOIMX)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IX04IMX01  (Index) 
--
CREATE INDEX DIGWEB.IX04IMX01 ON DIGWEB.IMX01
(APPIMX, FDALTA)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IX05IMX01  (Index) 
--
CREATE INDEX DIGWEB.IX05IMX01 ON DIGWEB.IMX01
(IMX03, IMX08)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- IX06IMX01  (Index) 
--
CREATE INDEX DIGWEB.IX06IMX01 ON DIGWEB.IMX01
(IMX20)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- PK001CATDESCDOCUMENTOS  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001CATDESCDOCUMENTOS ON DIGWEB.CATDESCDOCUMENTOS
(FIIDDOCUMENTO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK001CATDIGSCANNER  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001CATDIGSCANNER ON DIGWEB.CATDIGSCANNER
(FIIDSCANNER)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK001CATDIGTEMPLATE  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001CATDIGTEMPLATE ON DIGWEB.CATDIGTEMPLATE
(FIIDTEMPLATE, FIIDSCANNER)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK001CATDOCIMAX  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001CATDOCIMAX ON DIGWEB.CATDOCIMAX
(FCPRODUCTO, FIIDDIGWEB)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK001CATDOCUMENTOS  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001CATDOCUMENTOS ON DIGWEB.CATDOCUMENTOS
(FIOPEDOCUMENTO, FIIDDOCUMENTO, FISUBPRODUCTO, FIETAPA)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK001CATOPERADOCTOS  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001CATOPERADOCTOS ON DIGWEB.CATOPERADOCTOS
(FIOPEDOCUMENTO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK001DESC_LOG  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001DESC_LOG ON DIGWEB.DESC_LOG
(ID_DESC)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK001DIGSCANTMPL  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001DIGSCANTMPL ON DIGWEB.DIGSCANTMPL
(FIIDTEMPLATE, FIIDSCANNER, FIOPEDOCUMENTO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK001DOCTOSBASE  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK001DOCTOSBASE ON DIGWEB.DOCTOSBASE
(FIOPEDOCUMENTO, FIDDOCUMENTO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK_DESCHEADER  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK_DESCHEADER ON DIGWEB.DESCHEADERS
(IDTABLA)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK_IMX01  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK_IMX01 ON DIGWEB.IMX01
(APPIMX, EXPIMX)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK_IMX02  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK_IMX02 ON DIGWEB.IMX02
(APPIMX, EXPIMX, DOCIMX)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK_IMX03  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK_IMX03 ON DIGWEB.IMX03
(APPIMX, EXPIMX, DOCIMX, PAGIMX)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK_ORDERDOCS  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK_ORDERDOCS ON DIGWEB.ORDERDOCS
(ORDERDOC, FIOPEDOCUMENTO, FIETAPA, FISUBPRODUCTO)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- PK_UNIDAD_VOLUMEN  (Index) 
--
CREATE UNIQUE INDEX DIGWEB.PK_UNIDAD_VOLUMEN ON DIGWEB.DIG_UNIDAD_VOLUMEN
(UNIDAD, RUTA_BASE)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_DAT
/


--
-- UIX_LOGS_DIGITALIZA  (Index) 
--
CREATE INDEX DIGWEB.UIX_LOGS_DIGITALIZA ON DIGWEB.LOGS_DIGITALIZA
(FECHA)
NOLOGGING
TABLESPACE TBS_DIGWB_DATA01_IDX
/


--
-- PATYPES  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PATYPES   IS TYPE RCGCURSOR IS REF CURSOR; 
END; -- Package spec /
/


--
-- PKDIGUNIDADVOLUMEN  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGUNIDADVOLUMEN AS
PROCEDURE SPDIGWEBADMONUNIDADVOLUMEN(paOperacion IN NUMBER,paUNIDAD IN CHAR, paRUTA_BASE IN VARCHAR2, paESTADO_UNIDAD  IN NUMBER,  paTIPO_DISPOSITIVO    IN CHAR, paFCALIAS IN VARCHAR2,paFCRUTASOL  IN VARCHAR2,paFISTATUS IN NUMBER);
TYPE DIGCURSOR IS REF CURSOR;
FUNCTION FNDIGWEBCONUNIDADVOLUMENESTADO(paESTADO_UNIDAD IN NUMBER)  RETURN DIGCURSOR;
FUNCTION FNDIGWEBCONUNIDADVOLUMENRUTAS(paFCRUTASOL IN VARCHAR2)  RETURN DIGCURSOR;
END PKDIGUNIDADVOLUMEN;
/


--
-- PKDIGCATDOCIMAX  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGCATDOCIMAX AS


/***********************************************************************************************
   NAME:                  DIGWEB.PKDIGCATDOCIMAX
   DESCRIPCION:           PACKAGE ADMINISTRAR EL CATALOGO DE EQUIVALENCIAS DE DOCUMENTOS
   AUTOR:                 EDGAR TELLO HERNANDEZ
   FECHA CREACION:        09/11/2009
   VERSION:               1.0
   FECHA MODIFICACION:    
   NOTAS:
************************************************************************************************/


PROCEDURE SPDIGADMONCATDOCIMAX(paOperacion IN NUMBER,paFCPRODUCTO IN varchar2,paFIIDDIGWEB IN NUMBER,paFCDESCDOCUMENTO IN varchar2,paFIIDIMAX IN NUMBER,paFISTATUS IN NUMBER,paFCUSUARIO IN varchar2);
TYPE DIGCURSOR IS REF CURSOR;
FUNCTION FNDIGCONCATDOCIMAX(paOperacion IN NUMBER,paFCPRODUCTO IN varchar2,paFIIDDIGWEB IN NUMBER)  RETURN DIGCURSOR;
END PKDIGCATDOCIMAX;
/


--
-- PKDIGCAT_IP  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGCAT_IP AS


/***********************************************************************************************
   NAME:                  DIGWEB.PKDIGCAT_IP
   DESCRIPCION:           PACKAGE ADMINISTRAR EL CATALOGO DE IP´S
   AUTOR:                 EDGAR TELLO HERNANDEZ
   FECHA CREACION:        22/10/2009
   VERSION:               1.0
   FECHA MODIFICACION:    
   NOTAS:
************************************************************************************************/


PROCEDURE SPDIGADMONCAT_IP(paOperacion IN NUMBER,paFIFROMIP IN NUMBER,paFCIP_SCANER IN varchar2,paFCIP_SERVELET IN varchar2);
TYPE DIGCURSOR IS REF CURSOR;
FUNCTION FNDIGCONCAT_IP(paFIFROMIP IN NUMBER)  RETURN DIGCURSOR;
END PKDIGCAT_IP;
/


--
-- PKDIGABCWEB  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGABCWEB AS 
/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGABCWEB 
DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN PARA SISTEMA DE ACCESO PARA APLICACIONES  
             DE DIGITALIZACION 
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 11/08/2010 
FECHA ACTUALIZACION  17/08/2010
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
TYPE DIGCURSOR IS REF CURSOR; 
 
 
FUNCTION FNDIGABCCATDOCUMENTOS              (PAFIINOPCION                    IN    NUMBER                                                    ,
                                             PAFIOPEDOCUMENTO                IN    DIGWEB.CATDOCUMENTOS.FIOPEDOCUMENTO%TYPE                  , 
                                             PAFIIDDOCUMENTO                 IN    DIGWEB.CATDOCUMENTOS.FIIDDOCUMENTO%TYPE                   , 
                                             PAFCDESCDOCUMENTO               IN    DIGWEB.CATDOCUMENTOS.FCDESCDOCUMENTO%TYPE                 , 
                                             PAFCDESCCORTA                   IN    DIGWEB.CATDOCUMENTOS.FCDESCCORTA%TYPE                     , 
                                             PAFCEMPACTUALIZA                IN    DIGWEB.CATDOCUMENTOS.FCEMPACTUALIZA%TYPE                  , 
                                             PAFISTATUS                      IN    DIGWEB.CATDOCUMENTOS.FISTATUS%TYPE                        , 
                                             PAFIAGREGAPAG                   IN    DIGWEB.CATDOCUMENTOS.FIAGREGAPAG%TYPE                     , 
                                             PAFIETAPA                       IN    DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE                         , 
                                             PAFISUBPRODUCTO                 IN    DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE                   , 
                                             PAFIIDTABLA                     IN    DIGWEB.CATDOCUMENTOS.FIIDTABLA%TYPE                   , 
                                             PAFIORDER                       IN    DIGWEB.CATDOCUMENTOS.FIORDER%TYPE                         , 
                                             PAFCINICIO                      IN    VARCHAR2                                                  ,
                                             PAFCFIN                         IN    VARCHAR2)
                                             RETURN DIGCURSOR; 
                                             
FUNCTION FNDIGABCDIGUNIDADVOLUMEN             (PAFIINOPCION                    IN    NUMBER                                                    ,
                                             PAUNIDAD                        IN    DIGWEB.DIG_UNIDAD_VOLUMEN.UNIDAD%TYPE                     , 
                                             PARUTA_BASE                     IN    DIGWEB.DIG_UNIDAD_VOLUMEN.RUTA_BASE%TYPE                  , 
                                             PAESTADO_UNIDAD                 IN    DIGWEB.DIG_UNIDAD_VOLUMEN.ESTADO_UNIDAD%TYPE              , 
                                             PATIPO_DISPOSITIVO              IN    DIGWEB.DIG_UNIDAD_VOLUMEN.TIPO_DISPOSITIVO%TYPE           , 
                                             PAFCALIAS                       IN    DIGWEB.DIG_UNIDAD_VOLUMEN.FCALIAS%TYPE                    , 
                                             PAFCRUTASOL                     IN    DIGWEB.DIG_UNIDAD_VOLUMEN.FCRUTASOL%TYPE                  , 
                                             PAFISTATUS                      IN    DIGWEB.DIG_UNIDAD_VOLUMEN.FISTATUS%TYPE                   , 
                                             PAFCALIASSAMBA                  IN    DIGWEB.DIG_UNIDAD_VOLUMEN.FCALIASSAMBA%TYPE)
                                             RETURN DIGCURSOR;                                              
 
END PKDIGABCWEB;
/


--
-- PKDIGITALIZADOCTOS  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGITALIZADOCTOS AS
/***********************************************************************************************

NAME: DIGWEB.PKDIGITALIZADOCTOS
DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN PARA LA DIGITALIZACION POR WEB
AUTOR: ARMANDO OSORIO HERNANDEZ
FECHA CREACION: 11/08/2010
FECHA ACTUALIZACION 
VERSION: 1.0
FECHA MODIFICACION:
NOTAS:
************************************************************************************************/

TYPE DIGCURSOR IS REF CURSOR;



FUNCTION FNDIGGENERAEXPEDIENTE         (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,                                         
                                        PAIMX02                         IN    DIGWEB.IMX01.IMX02%TYPE                                   , 
                                        PAIMX03                         IN    DIGWEB.IMX01.IMX03%TYPE                                   , 
                                        PAIMX04                         IN    DIGWEB.IMX01.IMX04%TYPE                                   , 
                                        PAIMX05                         IN    DIGWEB.IMX01.IMX05%TYPE                                   , 
                                        PAIMX06                         IN    DIGWEB.IMX01.IMX06%TYPE                                   , 
                                        PAIMX07                         IN    DIGWEB.IMX01.IMX07%TYPE                                   , 
                                        PAIMX08                         IN    DIGWEB.IMX01.IMX08%TYPE                                   , 
                                        PAIMX09                         IN    DIGWEB.IMX01.IMX09%TYPE                                   , 
                                        PAIMX10                         IN    DIGWEB.IMX01.IMX10%TYPE                                   ,                                         
                                        PAIMX11                         IN    DIGWEB.IMX01.IMX11%TYPE                                   , 
                                        PAIMX12                         IN    DIGWEB.IMX01.IMX12%TYPE                                   , 
                                        PAIMX13                         IN    DIGWEB.IMX01.IMX13%TYPE                                   , 
                                        PAIMX14                         IN    DIGWEB.IMX01.IMX14%TYPE                                   , 
                                        PAIMX15                         IN    DIGWEB.IMX01.IMX15%TYPE                                   , 
                                        PAIMX16                         IN    DIGWEB.IMX01.IMX16%TYPE                                   , 
                                        PAIMX17                         IN    DIGWEB.IMX01.IMX17%TYPE                                   , 
                                        PAIMX18                         IN    DIGWEB.IMX01.IMX18%TYPE                                   , 
                                        PAIMX19                         IN    DIGWEB.IMX01.IMX19%TYPE                                   , 
                                        PAIMX20                         IN    DIGWEB.IMX01.IMX20%TYPE                                   , 
                                        PAFCCLIENTEUNICO                IN    DIGWEB.IMX01.FCCLIENTEUNICO%TYPE                          , 
                                        PAFIDOMICILIA                   IN    DIGWEB.IMX01.FIDOMICILIA%TYPE                             , 
                                        PAFISUCURSALDOM                 IN    DIGWEB.IMX01.FISUCURSALDOM%TYPE)
                                        RETURN DIGCURSOR;
 
FUNCTION FNDIGOBTIENEDOCTOS            (PAFIOPEDOCUMENTO                IN    NUMBER                                                   ,                                         
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                          , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                                , 
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE )
                                        RETURN DIGCURSOR;

FUNCTION FNDIGBORRAPAGINA              (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                ,  
                                        PADOCIMX                        IN    DIGWEB.IMX02.DOCIMX%TYPE                                ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                               ,
                                        PAUSUARIO                       IN    DIGWEB.IMX03.USUARIOIMX%TYPE                            ,
                                        PAWS                            IN    DIGWEB.IMX03.WSIMX%TYPE                                 ,
                                        PANUMPAG                        IN    NUMBER                                                  ,
                                        PANOMBREPAG                     IN    DIGWEB.IMX03.IMGIMX%TYPE                                ,
                                        PARUTAPAG                       IN    DIGWEB.IMX03.RUTIMX%TYPE )
                                        RETURN DIGCURSOR;

FUNCTION FNDIGCAMBIASTEXP              (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE)
                                        RETURN DIGCURSOR;   
                                        

FUNCTION FNDIGOBTIENEPAG               (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                                  ,
                                        PADOCIMX                        IN    DIGWEB.IMX02.IDDOCIMX%TYPE                                ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE)
                                        RETURN DIGCURSOR;                            
                                        
FUNCTION FNDIGOBTIENERUTA              (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                                  ,
                                        PADOCIMX                        IN    DIGWEB.IMX02.IDDOCIMX%TYPE                              ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE)
                                        RETURN DIGCURSOR; 

FUNCTION FNDIGGETEXPIMX                (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAIMX01                         IN    DIGWEB.IMX01.IMX01%TYPE)
                                        RETURN DIGCURSOR;         

FUNCTION FNDIGGRABADOCTO               (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                ,
                                        PAIDDOCIMX                      IN    DIGWEB.IMX02.IDDOCIMX%TYPE                              ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                               ,
                                        PAUSUARIO                       IN    DIGWEB.IMX03.USUARIOIMX%TYPE                            ,
                                        PAWS                            IN    DIGWEB.IMX03.WSIMX%TYPE                                 ,
                                        PAIMX01                         IN    DIGWEB.IMX01.IMX01%TYPE                                 ,  
                                        PAFCCARPETABASE                 IN    VARCHAR2                                                ,
                                        PAEXTENSIONARCH                 IN    VARCHAR2)
                                        RETURN DIGCURSOR;
                                        
FUNCTION FNDIGRUTABASE                 (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                                  ,
                                        PAFCCARPETABASE                 IN    VARCHAR2 )                  
                                        RETURN VARCHAR2;      
                                        
FUNCTION FNDIGOBTIENEDOCTOSBASE        (PAFIOPEDOCUMENTO                IN    NUMBER                                                   ,                                        
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                 ,
                                        PAFCCLIENTEUNICO                IN    DIGWEB.IMX01.FCCLIENTEUNICO%TYPE                         , 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                          , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE)
                                        RETURN DIGCURSOR; 

FUNCTION FNDIGACTSTATUSEXP              (PAFCAPPIMX                     IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAIMX01                         IN    DIGWEB.IMX01.IMX01%TYPE,
                                        PAEDOIMX                         IN    DIGWEB.IMX01.EDOIMX%TYPE)
                                        RETURN DIGCURSOR;
                                        
FUNCTION FNDGTGRABADOCTOWS             (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                ,
                                        PAIDDOCIMX                      IN    DIGWEB.IMX02.IDDOCIMX%TYPE                              ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                               ,
                                        PAUSUARIO                       IN    DIGWEB.IMX03.USUARIOIMX%TYPE                            ,
                                        PAWS                            IN    DIGWEB.IMX03.WSIMX%TYPE                                 ,
                                        PAIMX01                         IN    DIGWEB.IMX01.IMX01%TYPE                                 ,  
                                        PAFCCARPETABASE                 IN    VARCHAR2                                                ,
                                        PAEXTENSIONARCH                 IN    VARCHAR2)
                                        RETURN DIGCURSOR;                                                                    

FUNCTION FNDGTBORRAPAGINAWS            (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                ,  
                                        PADOCIMX                        IN    DIGWEB.IMX02.DOCIMX%TYPE                                ,                                                                                 
                                        PAPAGIMX                        IN    DIGWEB.IMX03.PAGIMX%TYPE                                ,  
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                               ,
                                        PAUSUARIO                       IN    DIGWEB.IMX03.USUARIOIMX%TYPE                            ,
                                        PAWS                            IN    DIGWEB.IMX03.WSIMX%TYPE)
                                        RETURN DIGCURSOR;                                                                             

FUNCTION FNDGUCAMBIASTEXPWS            (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                , 
                                        PAEDOIMX                        IN    DIGWEB.IMX01.EDOIMX%TYPE )
                                        RETURN DIGCURSOR;                                                                                                                                                                                                                    
END PKDIGITALIZADOCTOS;
/


--
-- PKDIGORDERDOCS  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGORDERDOCS AS

/***********************************************************************************************
NAME:          DIGWEB.PKDIGORDERDOCS

DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN EN LOS DOCUMENTOS QUE SE SOLICITAN
             PARA LA  DIGITALIZACION (ORDERDOCS)

AUTOR:          EDGAR TELLO HERNANDEZ

FECHA CREACION: 25/02/2009

VERSION:      1.2

FECHA MODIFICACION: 13/08/2009

NOTAS:
************************************************************************************************/

PROCEDURE SPDIGADMONORDERDOCS(paOperacion IN NUMBER,paORDERDOC IN NUMBER, paFIOPEDOCUMENTO IN NUMBER, paFIETAPA IN NUMBER, paFISUBPRODUCTO IN NUMBER, paFIDDOCUMENTO IN NUMBER, paIDTABLA IN NUMBER);
PROCEDURE SPDIGADMONCATOPERADOCTOS(paOperacion IN NUMBER,paFIOPEDOCUMENTO IN NUMBER,paFCDESCOPERADOCTO IN CHAR,paFCDESCCORTA IN CHAR,paFCEMPACTUALIZA IN CHAR);
PROCEDURE SPDIGADMONCATDESCDOCUMENTOS(paOperacion IN NUMBER,paFIIDDOCUMENTO IN NUMBER,paFCDESCDOCUMENTO IN CHAR,paFCDESCCORTA IN CHAR,paFCPROPIETARIO IN VARCHAR2,paFCORIGENDOCTO IN VARCHAR2,paFCEMPACTUALIZA IN CHAR,paFIDOCSUCID IN NUMBER);
PROCEDURE SPDIGADMONCATDOCUMENTOS(paOperacion IN NUMBER,paFIOPEDOCUMENTO IN NUMBER,paFIIDDOCUMENTO  IN NUMBER,paFCDESCDOCUMENTO IN CHAR,paFCDESCCORTA IN CHAR,paFCEMPACTUALIZA IN CHAR,paFISTATUS  IN NUMBER,paFIAGREGAPAG  IN NUMBER,paFIETAPA  IN NUMBER,paFISUBPRODUCTO  IN NUMBER);
TYPE DIGCURSOR IS REF CURSOR;
FUNCTION FNDIGCONORDERDOCS (paFIOPEDOCUMENTO IN NUMBER) RETURN DIGCURSOR;
PROCEDURE SPDIGADMONENCABIMX(paOperacion IN NUMBER,paID IN NUMBER,paAPPIMX IN VARCHAR2,paIMX IN VARCHAR2,paDESCIMX IN VARCHAR2);
PROCEDURE SPDIGADMONENCABEZADO(paOperacion IN NUMBER,paAPPIMX IN VARCHAR2,paRUTA IN VARCHAR2);
PROCEDURE SPDIGADMONTASERVCOLUMN(paOperacion IN NUMBER,paFCDESCSERV IN VARCHAR2,paFCCLUMNA IN VARCHAR2,paFCTIPOCOLUMNA IN VARCHAR2,paFCCORRESP_IMAX IN VARCHAR2);
PROCEDURE SPDIGADMONTASERVICIOSDG(paOperacion IN NUMBER,paFCDESCSERV IN VARCHAR2);
PROCEDURE SPDIGADMONDOCTOSBASE(paOperacion IN NUMBER,paFIOPEDOCUMENTO IN NUMBER,paFIDDOCUMENTO IN NUMBER);
END PKDIGORDERDOCS;
/


--
-- PKDIGVISOR  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGVISOR AS

/***********************************************************************************************

NAME: DIGWEB.PKDIGVISOR
DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN PARA EL VISOR GENERAL DE DIGITALIZACION
AUTOR: ARMANDO OSORIO HERNANDEZ
FECHA CREACION: 28/07/2009
VERSION: 1.0
FECHA MODIFICACION:
NOTAS:
************************************************************************************************/


TYPE DIGCURSOR IS REF CURSOR;

FUNCTION FNDIGGETDOCTOS       (PAFCAPPIMX           IN  DIGWEB.IMX01.APPIMX%TYPE,             
                               PAFCKEY              IN  DIGWEB.IMX01.IMX01%TYPE,                               
                               PAFISTATUS           IN      NUMBER)
                               RETURN DIGCURSOR;


FUNCTION FNGETDOCDIGWEB       (PAFCAPPIMX           IN  DIGWEB.IMX01.APPIMX%TYPE,             
                               PAFCKEY              IN  DIGWEB.IMX01.IMX01%TYPE,
                               PAFITIPODOCTO        IN  NUMBER,
                               PAFISTATUSIMX        IN  NUMBER,
                               PAFCTIPOOS           IN  VARCHAR2,
                               PAFINUMPAG           IN  NUMBER)  
                               RETURN DIGCURSOR;        


END PKDIGVISOR;
/


--
-- PKDIGSCANTMPL  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGSCANTMPL AS
PROCEDURE SPDIGADMONCATDIGSCANNER(paOperacion IN NUMBER,paFIIDSCANNER IN NUMBER,paFCDESCRIPCION IN varchar2,paFCMODELO IN varchar2,paFCFABRICANTE IN varchar2,paACTIVO IN NUMBER);
PROCEDURE SPDIGADMONCATDIGTEMPLATE(paOperacion IN NUMBER,paFIIDTEMPLATE  IN NUMBER,paFIIDSCANNER  IN NUMBER,paFCDESCRIPCION  IN varchar2,paFIVERSION IN NUMBER,paACTIVO IN NUMBER,paFCDFBCATA   IN varchar2);
PROCEDURE SPDIGADMONDIGSCANTMPL(paOperacion IN NUMBER,paFIIDTEMPLATE IN NUMBER,paFIIDSCANNER IN NUMBER,paFIOPEDOCUMENTO IN NUMBER);
TYPE DIGCURSOR IS REF CURSOR;
FUNCTION FNDIGCONCATDIGSCANNER(paMODELO IN VARCHAR2)  RETURN DIGCURSOR;
FUNCTION FNDIGCONCATDIGTEMPLATE(paACTIVO IN NUMBER)  RETURN DIGCURSOR;
FUNCTION FNDIGCONCATDIGXML(paFIOPEDOCUMENTO IN NUMBER)  RETURN DIGCURSOR;
FUNCTION FNDIGCONTEMPLATESCAN(paFIOPEDOCUMENTO IN NUMBER,paMODELO IN VARCHAR2)  RETURN DIGCURSOR;
FUNCTION FNDIGCONFIOPEDOCUMENTO(paFIOPEDOCUMENTO IN NUMBER)  RETURN DIGCURSOR;
FUNCTION FNDIGCONfechaUltProd(paFIOPEDOCUMENTO IN NUMBER)  RETURN DIGCURSOR;
FUNCTION FNDIGCONCATDIGSCANNERACTIVO(paACTIVO IN VARCHAR2)  RETURN DIGCURSOR;

END PKDIGSCANTMPL;
/


--
-- PKDIGABCDOCTOS_BASE  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGABCDOCTOS_BASE AS 
/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGABCWEB 
DESCRIPCION: PACKAGE CONTIENE FUNCION QUE SE UTILIZAN PARA EL CATALOGO DE DOCUMENTOS BASE
AUTOR: EDGAR TELLO HERNANDEZ 
FECHA CREACION: 19/10/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
TYPE DIGCURSOR IS REF CURSOR;
FUNCTION FNDIGABCDOCTOS_BASE              (PAFIINOPCION                    IN    NUMBER                                                    ,
                                             PAFIOPEDOCUMENTO                IN    DIGWEB.DOCTOSBASE.FIOPEDOCUMENTO%TYPE                  , 
                                             PAFIDDOCUMENTO                 IN    DIGWEB.DOCTOSBASE.FIDDOCUMENTO%TYPE                   )
RETURN DIGCURSOR;
END PKDIGABCDOCTOS_BASE;
/


--
-- PQDGABCDIGDOCWEB  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGABCDIGDOCWEB AS

/***********************************************************************************************
   NAME:                  DIGWEB.PQDGABCDIGDOCWEB 
   DESCRIPCION:           PACKAGE ADMINISTRAR EL CATALOGO DE DOCUMENTOS
   AUTOR:                 DIANA VERGARA
   FECHA CREACION:        18/07/2012
   VERSION:               1.0
   FECHA MODIFICACION:    
   NOTAS:
************************************************************************************************/

TYPE DIGCURSOR IS REF CURSOR; 

    FUNCTION PADGABCCATOPERADOCTOS    (PAFIINOPCION                 IN    VARCHAR2,
                                       PAFIOPEDOCUMENTO             IN    DIGWEB.CATOPERADOCTOS.FIOPEDOCUMENTO%TYPE, 
                                       PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE, 
                                       PAFCDESCCORTA                IN    DIGWEB.CATOPERADOCTOS.FCDESCCORTA%TYPE, 
                                       PAFCEMPACTUALIZA             IN    DIGWEB.CATOPERADOCTOS.FCEMPACTUALIZA%TYPE)
                                       RETURN DIGCURSOR; 
                                       
    FUNCTION PADGABCCATDESCDOCTOS     (PAFIINOPCION                 IN    VARCHAR2,
                                       PAFIIDDOCUMENTO              IN    DIGWEB.CATDESCDOCUMENTOS.FIIDDOCUMENTO%TYPE, 
                                       PAFCDESCDOCUMENTO            IN    DIGWEB.CATDESCDOCUMENTOS.FCDESCDOCUMENTO%TYPE, 
                                       PAFCDESCCORTA                IN    DIGWEB.CATDESCDOCUMENTOS.FCDESCCORTA%TYPE, 
                                       PAFCPROPIETARIO              IN    DIGWEB.CATDESCDOCUMENTOS.FCPROPIETARIO%TYPE, 
                                       PAFCORIGENDOCTO              IN    DIGWEB.CATDESCDOCUMENTOS.FCORIGENDOCTO%TYPE, 
                                       PAFCEMPACTUALIZA             IN    DIGWEB.CATDESCDOCUMENTOS.FCEMPACTUALIZA%TYPE) 
                                       RETURN DIGCURSOR;  
    
    FUNCTION PADGTGETSUBPRODUCTOS     (PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE) 
                                       RETURN DIGCURSOR; 
                                          
    FUNCTION PADGTGETETAPAS           (PAFIOPEDOCUMENTO             IN    DIGWEB.ORDERDOCS.FIOPEDOCUMENTO%TYPE,
                                       PAFISUBPRODUCTO              IN    DIGWEB.ORDERDOCS.FISUBPRODUCTO%TYPE)                                                                                                             
                                       RETURN DIGCURSOR;                           
                                       
    FUNCTION PADGTGETDOCUMENTOS       (PAFIOPEDOCUMENTO             IN    DIGWEB.ORDERDOCS.FIOPEDOCUMENTO%TYPE,
                                       PAFIETAPA                    IN    DIGWEB.ORDERDOCS.FIETAPA%TYPE,
                                       PAFISUBPRODUCTO              IN    DIGWEB.ORDERDOCS.FISUBPRODUCTO%TYPE)
                                       RETURN DIGCURSOR; 
                                       
    FUNCTION PADGTDELDOC             (PAFIOPEDOCUMENTO              IN    DIGWEB.ORDERDOCS.FIOPEDOCUMENTO%TYPE,
                                      PAFISUBPRODUCTO               IN    DIGWEB.ORDERDOCS.FISUBPRODUCTO%TYPE,
                                      PAFIETAPA                     IN    DIGWEB.ORDERDOCS.FIETAPA%TYPE,
                                      PAFIDDOCUMENTO                IN    DIGWEB.ORDERDOCS.FIDDOCUMENTO%TYPE)  
                                      RETURN DIGCURSOR;                                   
                                       
    FUNCTION PADGTSETDOCUMENTOS       (PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE,
                                       PAFIETAPA                    IN    DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE,
                                       PAFISUBPRODUCTO              IN    DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE,
                                       PAFCDESCDOCUMENTO            IN    DIGWEB.CATDESCDOCUMENTOS.FCDESCDOCUMENTO%TYPE,
                                       PAFCEMPACTUALIZA             IN    DIGWEB.CATDOCUMENTOS.FCEMPACTUALIZA%TYPE,
                                       PAFISTATUS                   IN    DIGWEB.CATDOCUMENTOS.FISTATUS%TYPE,
                                       PAFIIDTABLA                  IN    DIGWEB.CATDOCUMENTOS.FIIDTABLA%TYPE)
                                       RETURN DIGCURSOR;  
    
    FUNCTION FNDGTGETSUBPROD          (PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE) 
                                       RETURN DIGCURSOR;

    FUNCTION FNDGTGETETAPA            (PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE,
                                       paFISUBPRODUCTO IN NUMBER) 
                                       RETURN DIGCURSOR;
                                       
    FUNCTION FNDGTSETLLAVE            (PAFCDESCSERV           IN    DIGWEB.TASERVCOLUMN.FCDESCSERV%TYPE,
                                        PAFCCLUMNA             IN    DIGWEB.TASERVCOLUMN.FCCLUMNA%TYPE,
                                        PAFCTIPOCOLUMNA        IN    DIGWEB.TASERVCOLUMN.FCTIPOCOLUMNA%TYPE) 
                                        RETURN DIGCURSOR;                                    
                                                                                                                                                    
END PQDGABCDIGDOCWEB;
/


--
-- PQDGMANTIMX01  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGMANTIMX01 AS
TYPE  DIGCURSOR IS REF CURSOR;

PROCEDURE SPACTUALIZAEDO(
    PAAPPIMX            IN        DIGWEB.IMX01.APPIMX%TYPE          ,
    PAIMX03             IN        DIGWEB.IMX01.IMX03%TYPE           ,
    PAIMX02             IN        DIGWEB.IMX01.IMX02%TYPE           ,
    PAEDOIMX            IN        DIGWEB.IMX01.EDOIMX%TYPE          ,
    PACODERR            OUT       INTEGER                           ,
    PADESCERR           OUT       VARCHAR2
);

END PQDGMANTIMX01;
/


--
-- PQDGTENCABEZADOVISOR  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGTENCABEZADOVISOR AS

    TYPE  DIGCURSOR IS REF CURSOR;


    
    FUNCTION  FNDGTGETOPCIONBYID     (PAFIIDENCABEZADO  IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE)
    RETURN DIGCURSOR;
    
    
    
    FUNCTION FNDGTGETRANGOID         (paID              IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE,
                                      paID2             IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE)         
    RETURN DIGCURSOR;
  

    
    FUNCTION FNDGTGETIDENCBYAPPIMX   (PAFCAPPIMX        IN DIGWEB.TADGENCABEZADOVISOR.FCAPPIMX%TYPE)          
    RETURN DIGCURSOR;
  

    FUNCTION FNDGTGETIDENCBYAPPIMXREG   (PAFCAPPIMX     IN DIGWEB.TADGENCABEZADOVISOR.FCAPPIMX%TYPE)          
    RETURN DIGCURSOR;
    
   
    FUNCTION  FNDGICAB               (paFIIDENCABEZADO  IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE ,
                                      paFCAPPIMX        IN DIGWEB.TADGENCABEZADOVISOR.FCAPPIMX%TYPE       , 
                                      paFISERIAL        IN DIGWEB.TADGENCABEZADOVISOR.FISERIAL%TYPE       , 
                                      paFCABREVIATURA   IN DIGWEB.TADGENCABEZADOVISOR.FCABREVIATURA%TYPE  ,
                                      paFCDESCRIPCION   IN DIGWEB.TADGENCABEZADOVISOR.FCDESCRIPCION%TYPE  ,
                                      paFCCAMPOIMX      IN DIGWEB.TADGENCABEZADOVISOR.FCCAMPOIMX%TYPE     ,
                                      paFINUMORDEN      IN DIGWEB.TADGENCABEZADOVISOR.FINUMORDEN%TYPE     ,
                                      paFCVISORTITULO   IN DIGWEB.TADGENCABEZADOVISOR.FCVISORTITULO%TYPE  ,
                                      paFCIMAGEN        IN DIGWEB.TADGENCABEZADOVISOR.FCIMAGEN%TYPE       ,
                                      paFCUSRMODIFICO   IN DIGWEB.TADGENCABEZADOVISOR.FCUSRMODIFICO%TYPE  ) 
     RETURN DIGCURSOR;
     
     
     FUNCTION  FNDGICABOR             (paOPERACION      IN NUMBER                                         , 
                                      paFIIDENCABEZADO  IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE ,
                                      paFCAPPIMX        IN DIGWEB.TADGENCABEZADOVISOR.FCAPPIMX%TYPE       , 
                                      paFISERIAL        IN DIGWEB.TADGENCABEZADOVISOR.FISERIAL%TYPE       , 
                                      paFCABREVIATURA   IN DIGWEB.TADGENCABEZADOVISOR.FCABREVIATURA%TYPE  ,
                                      paFCDESCRIPCION   IN DIGWEB.TADGENCABEZADOVISOR.FCDESCRIPCION%TYPE  ,
                                      paFCCAMPOIMX      IN DIGWEB.TADGENCABEZADOVISOR.FCCAMPOIMX%TYPE     ,
                                      paFINUMORDEN      IN DIGWEB.TADGENCABEZADOVISOR.FINUMORDEN%TYPE     ,
                                      paFCVISORTITULO   IN DIGWEB.TADGENCABEZADOVISOR.FCVISORTITULO%TYPE  ,
                                      paFCIMAGEN        IN DIGWEB.TADGENCABEZADOVISOR.FCIMAGEN%TYPE       ,
                                      paFCUSRMODIFICO   IN DIGWEB.TADGENCABEZADOVISOR.FCUSRMODIFICO%TYPE  ) 
     RETURN DIGCURSOR;
      
     
     
     
    FUNCTION  FNDGDCAB               (paOPERACION       IN NUMBER                                         , 
                                      paFIIDENCABEZADO  IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE ,
                                      paFISERIAL        IN DIGWEB.TADGENCABEZADOVISOR.FISERIAL%TYPE       ) 
    RETURN DIGCURSOR;
     
    
    
    FUNCTION  FNDGUCABG              (paFIIDENCABEZADO  IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE,
                                      paFCABREVIATURA   IN DIGWEB.TADGENCABEZADOVISOR.FCABREVIATURA%TYPE , 
                                      paFCVISORTITULO   IN DIGWEB.TADGENCABEZADOVISOR.FCVISORTITULO%TYPE ,
                                      paFCIMAGEN        IN DIGWEB.TADGENCABEZADOVISOR.FCIMAGEN%TYPE      ,
                                      paFCUSRMODIFICO   IN DIGWEB.TADGENCABEZADOVISOR.FCUSRMODIFICO%TYPE ) 
    RETURN DIGCURSOR;
    
    
    FUNCTION  FNDGUCABE              (paFIIDENCABEZADO  IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE,
                                      paFISERIAL        IN DIGWEB.TADGENCABEZADOVISOR.FISERIAL%TYPE      ,
                                      paFCDESCRIPCION   IN DIGWEB.TADGENCABEZADOVISOR.FCDESCRIPCION%TYPE , 
                                      paFCCAMPOIMX      IN DIGWEB.TADGENCABEZADOVISOR.FCCAMPOIMX%TYPE    ,
                                      paFINUMORDEN      IN DIGWEB.TADGENCABEZADOVISOR.FINUMORDEN%TYPE    ,
                                      paFCUSRMODIFICO   IN DIGWEB.TADGENCABEZADOVISOR.FCUSRMODIFICO%TYPE ) 
    RETURN DIGCURSOR;
             
    
    
             
END  PQDGTENCABEZADOVISOR;
/


--
-- PQDGURECHUM  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGURECHUM AS 
                           
PROCEDURE SPDGURECHUM (paIMX01          IN      DIGWEB.IMX01.IMX01%TYPE,
                       paIMX02          IN      DIGWEB.IMX01.IMX02%TYPE,
                       paIMX03          IN      DIGWEB.IMX01.IMX03%TYPE
                     );                                                                                                                                
END PQDGURECHUM;
/


--
-- PQDGCARGADOCTOS  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGCARGADOCTOS AS

TYPE DIGCURSOR IS REF CURSOR; 

PROCEDURE SPDGIDOCTO(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX02.DOCIMX%TYPE,
                            paIDDOCIMX      IN DIGWEB.IMX02.IDDOCIMX%TYPE,
                            paNOMDOCIMX     IN DIGWEB.IMX02.NOMDOCIMX%TYPE,
                            paSTATUSIMX     IN DIGWEB.IMX02.STATUSIMX%TYPE,
                            paFISUBPRODUCTO IN DIGWEB.IMX02.FISUBPRODUCTO%TYPE,
                            paFIETAPA       IN DIGWEB.IMX02.FIETAPA%TYPE);

PROCEDURE SPDGIPAGINA(      paAPPIMX        IN DIGWEB.IMX03.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX03.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX03.DOCIMX%TYPE,
                            paPAGIMX        IN DIGWEB.IMX03.PAGIMX%TYPE,
                            paIMGIMX        IN DIGWEB.IMX03.IMGIMX%TYPE,
                            paRUTIMX        IN DIGWEB.IMX03.RUTIMX%TYPE,
                            paSTATUSIMX     IN DIGWEB.IMX03.STATUSIMX%TYPE,
                            paFISUBPRODUCTO IN DIGWEB.IMX03.FISUBPRODUCTO%TYPE,
                            paFIETAPA       IN DIGWEB.IMX03.FIETAPA%TYPE,
                            paUSUARIOIMX    IN DIGWEB.IMX03.USUARIOIMX%TYPE,
                            paWSIMX         IN DIGWEB.IMX03.WSIMX%TYPE);


FUNCTION  FNDGSMAXDOC(      paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE) RETURN DIGCURSOR; 

FUNCTION  FNDGSGETDOCIMX(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paIDDOCIMX      IN DIGWEB.IMX02.IDDOCIMX%TYPE) RETURN DIGCURSOR;

FUNCTION  FNDGSGETDOCIMXES( paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paIDDOCIMX      IN DIGWEB.IMX02.IDDOCIMX%TYPE,
                            paFISUBPRODUCTO IN DIGWEB.IMX02.FISUBPRODUCTO%TYPE,
                            paFIETAPA       IN DIGWEB.IMX02.FIETAPA%TYPE) RETURN DIGCURSOR;

                             
FUNCTION  FNDGSMAXPAG(      paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX      IN DIGWEB.IMX02.DOCIMX%TYPE) RETURN DIGCURSOR; 

PROCEDURE SPDGUDOCTO(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX02.DOCIMX%TYPE);
                            
FUNCTION  FNDGSDESCDOC(      paFIIDDOCUMENTO        IN DIGWEB.CATDESCDOCUMENTOS.FIIDDOCUMENTO%TYPE) RETURN DIGCURSOR;

PROCEDURE SPDGUSTATUSDOC(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX02.DOCIMX%TYPE,
                            paSTATUSIMX1    IN DIGWEB.IMX02.DOCIMX%TYPE,
                            paSTATUSIMX2    IN DIGWEB.IMX02.DOCIMX%TYPE);

PROCEDURE SPDGUSTATUSPAG(   paAPPIMX       IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX       IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX       IN DIGWEB.IMX02.DOCIMX%TYPE,
                            paPAGIMX       IN DIGWEB.IMX03.PAGIMX%TYPE,
                            paSTATUSIMX    IN DIGWEB.IMX03.STATUSIMX%TYPE);
                                                        
END PQDGCARGADOCTOS;
/


--
-- PQDGABCDIGWEB  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGABCDIGWEB AS



TYPE DIGCURSOR IS REF CURSOR;

FUNCTION FNDGSVERIFCAIMX01       (PAFCAPPIMX           IN  DIGWEB.IMX01.APPIMX%TYPE,             
                               PAFCIMX01              IN  DIGWEB.IMX01.IMX01%TYPE)
                               RETURN DIGCURSOR;

FUNCTION FNDGSARMALLAVE       (PAFCAPPIMX           IN  DIGWEB.IMX01.APPIMX%TYPE)
                               RETURN DIGCURSOR;

FUNCTION FNDGSGETRUTA(PAFCAPPIMX  IN  DIGWEB.IMX01.APPIMX%TYPE,             
                      PAFIEXPIMX  IN  DIGWEB.IMX01.EXPIMX%TYPE)  RETURN DIGCURSOR;


END PQDGABCDIGWEB;
/


--
-- PQDGDOMICILIA  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGDOMICILIA AS

    TYPE  DIGCURSOR IS REF CURSOR;
    
FUNCTION  FNDGUDOMCRED (paCuenta     IN  DIGWEB.IMX01.IMX01%TYPE ,
                        paSucursal   IN  DIGWEB.IMX01.IMX11%TYPE ,
                        paAppimx     IN  DIGWEB.IMX01.APPIMX%TYPE,
                        paExpimx     IN  DIGWEB.IMX01.EXPIMX%TYPE)
    RETURN DIGCURSOR;
    
FUNCTION  FNDGSDOMCRED (paImx01      IN  DIGWEB.IMX01.IMX01%TYPE ,
                        paAppimx     IN  DIGWEB.IMX01.APPIMX%TYPE)
    RETURN DIGCURSOR;
    
    
END  PQDGDOMICILIA;
/


--
-- PKDIGABCCONTRATOSX  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PKDIGABCCONTRATOSX
AS
   /***********************************************************************************************
   NAME: DIGWEB.PKDIGABCCONTRATOSX
   DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN PARA SISTEMA DE GENERACION CONTRATOS WEB
                DE DIGITALIZACION
   AUTOR: Jesus Nieto Porras
   FECHA CREACION: 10/02/2014
   FECHA ACTUALIZACION
   VERSION: 1.0
   FECHA MODIFICACION: 07/03/2014 Agregan Opciones de Actualizacion de Datos
   NOTAS:
   ************************************************************************************************/
   TYPE DIGCURSOR IS REF CURSOR;

   FUNCTION FNDIGABCCATDIGCONTRATOSX (
      PAFIINOPCION        IN NUMBER,
      PAFIIDREG           IN DIGWEB.TCCATCONTRATOS.FIIDREG%TYPE,
      PAFCPRODUCTO        IN DIGWEB.TCCATCONTRATOS.FCPRODUCTO%TYPE,
      PAFIIDCONTRATO      IN DIGWEB.TCCATCONTRATOS.FIIDCONTRATO%TYPE,
      PAFCIDCONTRATO      IN DIGWEB.TCCATCONTRATOS.FCIDCONTRATO%TYPE,
      PAFCLLAVECONTRATO   IN DIGWEB.TCCATCONTRATOS.FCLLAVECONTRATO%TYPE,
      PAFDFECHAALTA       IN VARCHAR2,
      PAFDMODIFICACION    IN VARCHAR2,
      PAFCUSRMODIFICO     IN DIGWEB.TCCATCONTRATOS.FCUSRMODIFICO%TYPE)
      RETURN DIGCURSOR;

   FUNCTION FNDIGABCCATDIGDETCONTRATOSX (
      PAFIINOPCION       IN NUMBER,
      PAFIIDREG          IN DIGWEB.TCCATDETCONTRATOS.FIIDREG%TYPE,
      PAFINOPAG          IN DIGWEB.TCCATDETCONTRATOS.FINOPAG%TYPE,
      PAFCRUTAIMAGEN     IN DIGWEB.TCCATDETCONTRATOS.FCRUTAIMAGEN%TYPE,
      PAFCDESC           IN DIGWEB.TCCATDETCONTRATOS.FCDESC%TYPE,
      PAFDFECHAALTA      IN VARCHAR2,
      PAFDMODIFICACION   IN VARCHAR2,
      PAFCUSRMODIFICO    IN DIGWEB.TCCATDETCONTRATOS.FCUSRMODIFICO%TYPE)
      RETURN DIGCURSOR;

   FUNCTION FNDIGABCTCCATCORDENADAS (
      PAFIINOPCION       IN NUMBER,
      PAFIIDREG          IN DIGWEB.TCCATCORDENADAS.FIIDREG%TYPE,
      PAFINOPAG          IN DIGWEB.TCCATCORDENADAS.FINOPAG%TYPE,
      PAFCDESCCAMPO      IN DIGWEB.TCCATCORDENADAS.FCDESCCAMPO%TYPE,
      PAFCCORDIMAGEN     IN DIGWEB.TCCATCORDENADAS.FCCORDIMAGEN%TYPE,
      PAFCCORDTEXTO      IN DIGWEB.TCCATCORDENADAS.FCCORDTEXTO%TYPE,
      PAFDFECHAALTA      IN VARCHAR2,
      PAFDMODIFICACION   IN VARCHAR2,
      PAFCUSRMODIFICO    IN DIGWEB.TCCATCORDENADAS.FCUSRMODIFICO%TYPE)
      RETURN DIGCURSOR;

   FUNCTION FNDIGABCDIGDATOSPADX (
      PAFIINOPCION       IN NUMBER,
      PAFIIDREG          IN DIGWEB.TADGDATOSPAD.FIIDREG%TYPE,
      PAFINOPAG          IN DIGWEB.TADGDATOSPAD.FINOPAG%TYPE,
      PAFIEXPIMX         IN DIGWEB.TADGDATOSPAD.FIEXPIMX%TYPE,
      PAFISOLICITUD      IN DIGWEB.TADGDATOSPAD.FISOLICITUD%TYPE,
      PAFCDESCCAMPO      IN DIGWEB.TADGDATOSPAD.FCDESCCAMPO%TYPE,
      PAFCRUTAIMAGEN     IN DIGWEB.TADGDATOSPAD.FCRUTAIMAGEN%TYPE,
      PAFCTEXTO          IN DIGWEB.TADGDATOSPAD.FCTEXTO%TYPE,
      PAFISTATUS         IN DIGWEB.TADGDATOSPAD.FISTATUS%TYPE,
      PAFDFECHAALTA      IN VARCHAR2,
      PAFDMODIFICACION   IN VARCHAR2,
      PAFCUSRMODIFICO    IN DIGWEB.TADGDATOSPAD.FCUSRMODIFICO%TYPE)
      RETURN DIGCURSOR;
END PKDIGABCCONTRATOSX;
/


--
-- PQDGMANTODOCS  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGMANTODOCS
AS
   PROCEDURE SPCATCONTRAMANTO (
      PAOPCION          IN     INTEGER,
      PAIDREG           IN     DIGWEB.TCCATCONTRATOS.FIIDREG%TYPE,
      PAPRODUCTO        IN     DIGWEB.TCCATCONTRATOS.FCPRODUCTO%TYPE,
      PAIDCONTRATO      IN     DIGWEB.TCCATCONTRATOS.FIIDCONTRATO%TYPE,
      PAFCIDCONTRATO    IN     DIGWEB.TCCATCONTRATOS.FCIDCONTRATO%TYPE,
      PALLAVECONTRATO   IN     DIGWEB.TCCATCONTRATOS.FCLLAVECONTRATO%TYPE,
      PAUSRMODIFICO     IN     DIGWEB.TCCATCONTRATOS.FCUSRMODIFICO%TYPE,
      PACODERROR           OUT INTEGER,
      PADESCERROR          OUT VARCHAR2);

   PROCEDURE SPCATCORDENADA (
      PAOPCION        IN     INTEGER,
      PAIDREG         IN     DIGWEB.TCCATCORDENADAS.FIIDREG%TYPE,
      PANOPAG         IN     DIGWEB.TCCATCORDENADAS.FINOPAG%TYPE,
      PADESCCAMPO     IN     DIGWEB.TCCATCORDENADAS.FCDESCCAMPO%TYPE,
      PACORDIMAGEN    IN     DIGWEB.TCCATCORDENADAS.FCCORDIMAGEN%TYPE,
      PACORDTEXTO     IN     DIGWEB.TCCATCORDENADAS.FCCORDTEXTO%TYPE,
      PAUSRMODIFICO   IN     DIGWEB.TCCATCORDENADAS.FCUSRMODIFICO%TYPE,
      PACODERROR         OUT INTEGER,
      PADESCERROR        OUT VARCHAR2);

   PROCEDURE SPCATDETCONTRA (
      PAOPCION        IN     INTEGER,
      PAIDREG         IN     DIGWEB.TCCATDETCONTRATOS.FIIDREG%TYPE,
      PANOPAG         IN     DIGWEB.TCCATDETCONTRATOS.FINOPAG%TYPE,
      PARUTAIMAGEN    IN     DIGWEB.TCCATDETCONTRATOS.FCRUTAIMAGEN%TYPE,
      PADESC          IN     DIGWEB.TCCATDETCONTRATOS.FCDESC%TYPE,
      PAUSRMODIFICO   IN     DIGWEB.TCCATDETCONTRATOS.FCUSRMODIFICO%TYPE,
      PACODERROR         OUT INTEGER,
      PADESCERROR        OUT VARCHAR2);
END PQDGMANTODOCS;
/


--
-- PQDGTGETRUTAS  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGTGETRUTAS  AS

    TYPE  DIGCURSOR IS REF CURSOR;


    
    FUNCTION FNDGSGETEXPIMX    (paAPPIMX        IN     DIGWEB.IMX01.APPIMX%TYPE,
                                paIMX01         IN     DIGWEB.IMX01.IMX01%TYPE )         
    RETURN DIGCURSOR;
    
    
    FUNCTION FNDGSGETRUTAS    (paAPPIMX         IN     DIGWEB.IMX01.APPIMX%TYPE       ,
                               paEXPIMX         IN     DIGWEB.IMX01.EXPIMX%TYPE       ,
                               paFIETAPA        IN     DIGWEB.IMX02.FIETAPA%TYPE      ,
                               paFISUBPRODUCTO  IN     DIGWEB.IMX02.FISUBPRODUCTO%TYPE,
                               paSTATUSIMX      IN     DIGWEB.IMX02.STATUSIMX%TYPE    )         
    RETURN DIGCURSOR;
  
    FUNCTION FNDGSGETEXPIMXWS  (paAPPIMX     IN     DIGWEB.IMX01.APPIMX%TYPE   ,
                                paIMX01      IN     DIGWEB.IMX01.IMX01%TYPE    ,
                                paIdDocimx   IN     DIGWEB.IMX02.IDDOCIMX%TYPE )         
    RETURN DIGCURSOR;
    
    FUNCTION FNDGUACTPAG(paAppimx        IN DIGWEB.IMX03.APPIMX%TYPE       ,
                         paExpimx        IN DIGWEB.IMX03.EXPIMX%TYPE       , 
                         paDocumento     IN DIGWEB.IMX03.DOCIMX%TYPE       , 
                         paPagina        IN DIGWEB.IMX03.PAGIMX%TYPE       ,
                         paSubproducto   IN DIGWEB.IMX03.FISUBPRODUCTO%TYPE,
                         paEtapa         IN DIGWEB.IMX03.FIETAPA%TYPE      ,
                         paStatus        IN DIGWEB.IMX03.STATUSIMX%TYPE    )      
    RETURN DIGCURSOR;
             
END  PQDGTGETRUTAS;
/


--
-- PQDGDOCTOSWI  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGDOCTOSWI AS

TYPE DIGCURSOR IS REF CURSOR; 


FUNCTION  FNDGSGETDOCIMX(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paSTATUSIMX      IN DIGWEB.IMX02.STATUSIMX%TYPE) RETURN DIGCURSOR;


FUNCTION FNDGUCATDESCDOC               (PAFIIDDOCUMENTO        IN DIGWEB.CATDESCDOCUMENTOS.FIIDDOCUMENTO%TYPE,
                                        PAFCDESCDOCUMENTO      IN DIGWEB.CATDESCDOCUMENTOS.FCDESCDOCUMENTO%TYPE) RETURN DIGCURSOR;

FUNCTION FNDGUCATDOCTO               (PAFIOPEDOCUMENTO       IN DIGWEB.CATDOCUMENTOS.FIOPEDOCUMENTO%TYPE,
                                      PAFIIDDOCUMENTO        IN DIGWEB.CATDOCUMENTOS.FIIDDOCUMENTO%TYPE,
                                      PAFCDESCDOCUMENTO      IN DIGWEB.CATDOCUMENTOS.FCDESCDOCUMENTO%TYPE) RETURN DIGCURSOR;

END PQDGDOCTOSWI;
/


--
-- PQDGVISORWEB  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGVISORWEB AS
/*********************************************************************************************** 
 
NAME: IDIGWEB.PQDGVISORWEB
DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN EL VISOR DE DOCUMENTOS DEL ESQUEMA
             DIGWEB
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 26/01/2012 
FECHA ACTUALIZACION  
VERSION: 1.0
FECHA MODIFICACION: JNP-13AGO2013- Consulta Mediante NumAutorizacion y NumAfiliacion
NOTAS: 
************************************************************************************************/

TYPE DIGCURSOR IS REF CURSOR;



FUNCTION FNDGSVISORWEB                      (PAFIOPCION         IN          NUMBER                                  ,
                                             PAFCAPPIMX         IN          DIGWEB.IMX01.APPIMX%TYPE                ,
                                             PAFCIMX01          IN          DIGWEB.IMX01.IMX01%TYPE                 ,
                                             PAFIEXPIMX         IN          DIGWEB.IMX01.EXPIMX%TYPE                ,
                                             PAFISUBPRODUCTO    IN          DIGWEB.IMX02.FISUBPRODUCTO%TYPE         ,
                                             PAFIETAPA          IN          DIGWEB.IMX02.FIETAPA%TYPE               ,
                                             PAFISTATUSIMX2     IN          DIGWEB.IMX02.STATUSIMX%TYPE             ,
                                             PAFISTATUSIMX3     IN          DIGWEB.IMX03.STATUSIMX%TYPE             ,
                                             PAFIDOCIMX         IN          DIGWEB.IMX02.DOCIMX%TYPE                ,
                                             PAFIIDDOCIMX       IN          DIGWEB.IMX02.IDDOCIMX%TYPE              ,
                                             PAFCSVRHTTP        IN          VARCHAR2                                ,
                                             PAFCARPETABASE     IN          VARCHAR2                                ,
                                             PAFCCARPETAWEB     IN          VARCHAR2)          
                                             RETURN DIGCURSOR;
                                            
                                             
END PQDGVISORWEB;
/


--
-- PQDGBITACORACHEQUEMOVIL  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGBITACORACHEQUEMOVIL AS


TYPE  DIGCURSOR IS REF CURSOR;

/*
Inserta un nuevo registro en la Bitacora
*/

FUNCTION FNDGINSERTCHQMOVIL(paFCProducto         IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCProducto%TYPE     ,
                            paFCBandaChq         IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCBandaChq%TYPE     ,
                            paFCTipoCheque       IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCTipoCheque%TYPE   ,
                            paFCIdDocumento      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCIdDocumento%TYPE  ,
                            paFCPais             IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCPais%TYPE         ,
                            paFCCanal            IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCCanal%TYPE        ,
                            paFCSucursal         IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCSucursal%TYPE     ,
                            paFCOpcionChq        IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCOpcionChq%TYPE    ,
                            paFCCuentaCargo      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCCuentaCargo%TYPE  ,
                            paFCCuentaAbono      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCCuentaAbono%TYPE  ,
                            paFCImporte          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCImporte%TYPE      ,
                            paFCNumeroChq        IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCNumeroChq%TYPE    ,
                            paFCFechaOp          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCFechaOp%TYPE      ,
                            paFCDivisa           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCDivisa%TYPE       ,
                            paFCCodigo           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCCodigo%TYPE       ,
                            paFCTipoBfc          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCTipoBfc%TYPE      ,
                            paFCRefPago          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCRefPago%TYPE      ,
                            paFCNumRtc           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCNumRtc%TYPE       ,
                            paFCHoraOp           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCHoraOp%TYPE       ,
                            paFCimx18            IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCimx18%TYPE        ,
                            paFCimx19            IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCimx19%TYPE        ,
                            paFCimx20            IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCimx20%TYPE        ,
                            paFCExtensionImg     IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCExtensionImg%TYPE ,
                            paFCUsuario          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCUsuario%TYPE      ,
                            paFCWorkStation      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCWorkStation%TYPE  ,
                            paFCIdSubproducto    IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCIdSubproducto%TYPE,
                            paFCIdEtapa          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCIdEtapa%TYPE      ,
                            paFCEnviaImagen      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCEnviaImagen%TYPE  ,
                            paFCEdoImx           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCEdoImx%TYPE       ,
                            paFCTipoExt          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCTipoExt%TYPE      ,
                            paFCVerifica         IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCVerifica%TYPE     ,
                            paFCMensaje          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCMensaje%TYPE      )        
RETURN DIGCURSOR;




/*
BORRA un nuevo registro en la Bitacora
*/
FUNCTION FNDGDCHQMOVIL(paFCSerial           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCSERIAL%TYPE)        
RETURN DIGCURSOR;




/*
consultA un nuevo registro en la Bitacora x banda
*/
FUNCTION FNDGSECHQMOVILBN(paBanda      IN   DIGWEB.TADGBITACORACHEQUEMOVIL.FCBANDACHQ%TYPE,
                          paFCProducto IN   DIGWEB.TADGBITACORACHEQUEMOVIL.FCPRODUCTO%TYPE)        
RETURN DIGCURSOR;



/*
consultA un nuevo registro en la Bitacora
*/
FUNCTION FNDGSECHQMOVIL(paFecha           IN  VARCHAR,
                        paFechaDos        IN  VARCHAR)        
RETURN DIGCURSOR;



/*
*/
FUNCTION FNDGGETBANDA (paLlave    IN   DIGWEB.IMX01.IMX01%TYPE,
                       paProducto IN   DIGWEB.IMX01.APPIMX%TYPE)    
RETURN DIGCURSOR;







/*
Inserta en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGINSERTTERMINAL(paFIIdTerminal    IN  DIGWEB.TCDGTERMINALCHQMOVIL.FIIdTerminal%TYPE   ,
                            paFCTerminal      IN  DIGWEB.TCDGTERMINALCHQMOVIL.FCTerminal%TYPE     ,
                            paFCESTATUS       IN  DIGWEB.TCDGTERMINALCHQMOVIL.FCESTATUS%TYPE      )        
RETURN DIGCURSOR;

/*
BORRA en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGDELTERMINAL   (paFIIdTerminal    IN  DIGWEB.TCDGTERMINALCHQMOVIL.FIIdTerminal%TYPE)        
RETURN DIGCURSOR;


/*
CONSULTA en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGSQTERMINAL   (paTerminal    IN  DIGWEB.TCDGTERMINALCHQMOVIL.FIIdTerminal%TYPE,
                           paTerminalD   IN  DIGWEB.TCDGTERMINALCHQMOVIL.FIIdTerminal%TYPE)
RETURN DIGCURSOR;


/*
Actualiza en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGGETTERMINAL(STATUS   IN   VARCHAR)        
RETURN DIGCURSOR;


/*
Actualiza en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGLIBERATERMINAL  (paFCTERMINAL         IN  DIGWEB.TCDGTERMINALCHQMOVIL.FCTERMINAL%TYPE)
RETURN DIGCURSOR;



END  PQDGBITACORACHEQUEMOVIL;
/


--
-- PQDGCHEQUESBC  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGCHEQUESBC AS

    TYPE  DIGCURSOR IS REF CURSOR;

FUNCTION  FNDGSCHEQUE (    PAIMX01        IN DIGWEB.IMX01.IMX01%TYPE)
RETURN DIGCURSOR;    
    
FUNCTION  FNDGSIMX01 (    paAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            paEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE)
    RETURN DIGCURSOR;  
FUNCTION  FNDGSIMX20 (    paAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            paEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                            paIMX20        IN DIGWEB.IMX01.IMX20%TYPE)
RETURN DIGCURSOR;                                  
FUNCTION  FNDGSTOTIMX20 (    paAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            paEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                            paIMX20        IN DIGWEB.IMX01.IMX20%TYPE)
RETURN DIGCURSOR;
FUNCTION  FNDGSTOTIMX01 (    paAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            paEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE)
    RETURN DIGCURSOR; 

FUNCTION  FNDGSGETFECHA 
    RETURN DIGCURSOR;

FUNCTION  FNDGSGETFECHA2 
    RETURN DIGCURSOR;

FUNCTION FNDGUEDOIMX18               (PAEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAIMX18        IN DIGWEB.IMX01.IMX18%TYPE,
                                      PAIMX01        IN DIGWEB.IMX01.IMX01%TYPE
                                       )
RETURN DIGCURSOR; 
FUNCTION FNDGUEDOIMX               (PAEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAEDOIMX2        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE
                                       )
RETURN DIGCURSOR;    

FUNCTION FNDGUEDOIMX20               (PAEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAEDOIMX2        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                                      PAIMX20        IN DIGWEB.IMX01.IMX20%TYPE
                                       )

RETURN DIGCURSOR; 

FUNCTION  FNDGSREPPORF (    PAAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            PAFECHAINI        IN VARCHAR2,
                            PAFECHAFIN        IN VARCHAR2)
RETURN DIGCURSOR;

FUNCTION  FNDGSTOTREPPORF (    PAAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            PAFECHAINI        IN VARCHAR2,
                            PAFECHAFIN        IN VARCHAR2)
RETURN DIGCURSOR;


END  PQDGCHEQUESBC;
/


--
-- PQDGTCDGCHQDEV  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGTCDGCHQDEV AS 
TYPE DIGCURSOR IS REF CURSOR; 
 
 
FUNCTION FNDIGABCTCDGCHQDEV              (PAFIINOPCION                    IN    NUMBER                                                    ,
                                             PAFIIDCAUSA                   IN    DIGWEB.TCDGCHQDEV.FIIDCAUSA%TYPE                       , 
                                             PAFCDESCRIPCION                 IN    DIGWEB.TCDGCHQDEV.FCDESCRIPCION%TYPE                     ,  
                                             PAFIESTATUS                   IN    DIGWEB.TCDGCHQDEV.FIESTATUS%TYPE                       ,    
                                             PAFCINICIO                      IN    VARCHAR2                                                  ,
                                             PAFCFIN                         IN    VARCHAR2                                                  ,
                                             PAFCUSURBD                      IN    VARCHAR2)
                                             RETURN DIGCURSOR; 

END PQDGTCDGCHQDEV;
/


--
-- PQDGDIGVISORUNICO  (Package) 
--
CREATE OR REPLACE PACKAGE DIGWEB.PQDGDIGVISORUNICO AS
TYPE  DIGCURSOR IS REF CURSOR;
    FUNCTION FNDGSDOCAPPS   (cliente_unico        IN   DIGWEB.IMX01.IMX20%TYPE ,
                                 http                 IN   VARCHAR2                ,
                                 tit_aplic_micro      IN   DIGWEB.IMX01.APPIMX%TYPE,
                                 tit_aplic_iusa       IN   DIGWEB.IMX01.APPIMX%TYPE,
                                 statusimxpag         IN   DIGWEB.IMX02.STATUSIMX%TYPE,
                                 statusimxdoc         IN   DIGWEB.IMX03.STATUSIMX%TYPE,
                                 statusetapa          IN   DIGWEB.IMX02.FIETAPA%TYPE,
                                 statussubprod        IN   DIGWEB.IMX02.FISUBPRODUCTO%TYPE)
        RETURN DIGCURSOR;
END  PQDGDIGVISORUNICO;
/


--
-- PKDIGUNIDADVOLUMEN  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGUNIDADVOLUMEN AS

PROCEDURE SPDIGWEBADMONUNIDADVOLUMEN(paOperacion IN NUMBER,paUNIDAD IN CHAR, paRUTA_BASE IN VARCHAR2, paESTADO_UNIDAD  IN NUMBER,  paTIPO_DISPOSITIVO    IN CHAR, paFCALIAS IN VARCHAR2,paFCRUTASOL  IN VARCHAR2,paFISTATUS IN NUMBER)
IS
BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.DIG_UNIDAD_VOLUMEN (UNIDAD, RUTA_BASE, ESTADO_UNIDAD,  TIPO_DISPOSITIVO,  FCALIAS,  FCRUTASOL, FISTATUS)
            values(paUNIDAD, paRUTA_BASE, paESTADO_UNIDAD,  paTIPO_DISPOSITIVO,  paFCALIAS,  paFCRUTASOL, paFISTATUS);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.DIG_UNIDAD_VOLUMEN WHERE UNIDAD=paUNIDAD;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.DIG_UNIDAD_VOLUMEN SET ESTADO_UNIDAD=paESTADO_UNIDAD
        WHERE UNIDAD=paUNIDAD;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

FUNCTION FNDIGWEBCONUNIDADVOLUMENESTADO(paESTADO_UNIDAD IN NUMBER)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
        SELECT * from DIGWEB.DIG_UNIDAD_VOLUMEN
                WHERE ESTADO_UNIDAD =paESTADO_UNIDAD ;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;

FUNCTION FNDIGWEBCONUNIDADVOLUMENRUTAS(paFCRUTASOL IN VARCHAR2)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
        SELECT * from DIGWEB.DIG_UNIDAD_VOLUMEN
                WHERE FCRUTASOL =paFCRUTASOL ;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;

END PKDIGUNIDADVOLUMEN;
/


--
-- PKDIGCATDOCIMAX  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGCATDOCIMAX AS

PROCEDURE SPDIGADMONCATDOCIMAX(paOperacion IN NUMBER,paFCPRODUCTO IN varchar2,paFIIDDIGWEB IN NUMBER,paFCDESCDOCUMENTO IN varchar2,paFIIDIMAX IN NUMBER,paFISTATUS IN NUMBER,paFCUSUARIO IN varchar2)
IS

BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.CATDOCIMAX (FCPRODUCTO,FIIDDIGWEB,FCDESCDOCUMENTO,FIIDIMAX,FISTATUS,FDFECHACTUALIZACION,FCUSUARIO)
               values(paFCPRODUCTO,paFIIDDIGWEB,paFCDESCDOCUMENTO,paFIIDIMAX,paFISTATUS,SYSDATE,paFCUSUARIO);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.CATDOCIMAX WHERE FCPRODUCTO=paFCPRODUCTO AND FIIDDIGWEB=paFIIDDIGWEB;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.CATDOCIMAX SET FCDESCDOCUMENTO=paFCDESCDOCUMENTO,FIIDIMAX=paFIIDIMAX;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


FUNCTION FNDIGCONCATDOCIMAX(paOperacion IN NUMBER,paFCPRODUCTO IN varchar2,paFIIDDIGWEB IN NUMBER)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN


IF paOperacion=1 THEN

     OPEN DIGCURSALIDA FOR
        SELECT * from DIGWEB.CATDOCIMAX
                WHERE FCPRODUCTO=paFCPRODUCTO;
        RETURN  DIGCURSALIDA;
    ELSIF paOperacion=2 THEN

     OPEN DIGCURSALIDA FOR
        SELECT * from DIGWEB.CATDOCIMAX
                WHERE FCPRODUCTO=paFCPRODUCTO AND FIIDDIGWEB=paFIIDDIGWEB;
        RETURN  DIGCURSALIDA;
    END IF;



EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;

END PKDIGCATDOCIMAX;
/


--
-- PKDIGCAT_IP  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGCAT_IP AS

PROCEDURE SPDIGADMONCAT_IP(paOperacion IN NUMBER,paFIFROMIP IN NUMBER,paFCIP_SCANER IN varchar2,paFCIP_SERVELET IN varchar2)
IS

BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.CAT_IP (FIFROMIP,FCIP_SCANER,FCIP_SERVELET)
               values(paFIFROMIP,paFCIP_SCANER,paFCIP_SERVELET);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.CAT_IP WHERE FIFROMIP=paFIFROMIP;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.CAT_IP SET FCIP_SCANER=paFCIP_SCANER,FCIP_SERVELET=paFCIP_SERVELET WHERE FIFROMIP=paFIFROMIP;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


FUNCTION FNDIGCONCAT_IP(paFIFROMIP IN NUMBER)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
        SELECT * from DIGWEB.CAT_IP
                WHERE FIFROMIP =paFIFROMIP;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;

END PKDIGCAT_IP;
/


--
-- PKDIGABCWEB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGABCWEB AS 
/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGABCWEB 
DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN PARA SISTEMA DE ACCESO PARA APLICACIONES  
             DE DIGITALIZACION 
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 11/08/2010 
FECHA ACTUALIZACION  17/08/2010
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
 
/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGABCWEB.FUNCTION FNDIGABCCATDOCUMENTOS 
DESCRIPCION: FUNCION QUE REALIZA ALTAS BAJAS MODIFICACIONES Y CONSULTAS DE LA TABLA DIGWEB.CATDOCUMENTOS
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 11/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
 
 
FUNCTION FNDIGABCCATDOCUMENTOS              (PAFIINOPCION                    IN    NUMBER                                                    ,
                                             PAFIOPEDOCUMENTO                IN    DIGWEB.CATDOCUMENTOS.FIOPEDOCUMENTO%TYPE                  , 
                                             PAFIIDDOCUMENTO                 IN    DIGWEB.CATDOCUMENTOS.FIIDDOCUMENTO%TYPE                   , 
                                             PAFCDESCDOCUMENTO               IN    DIGWEB.CATDOCUMENTOS.FCDESCDOCUMENTO%TYPE                 , 
                                             PAFCDESCCORTA                   IN    DIGWEB.CATDOCUMENTOS.FCDESCCORTA%TYPE                     , 
                                             PAFCEMPACTUALIZA                IN    DIGWEB.CATDOCUMENTOS.FCEMPACTUALIZA%TYPE                  , 
                                             PAFISTATUS                      IN    DIGWEB.CATDOCUMENTOS.FISTATUS%TYPE                        , 
                                             PAFIAGREGAPAG                   IN    DIGWEB.CATDOCUMENTOS.FIAGREGAPAG%TYPE                     , 
                                             PAFIETAPA                       IN    DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE                         , 
                                             PAFISUBPRODUCTO                 IN    DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE                   , 
                                             PAFIIDTABLA                     IN    DIGWEB.CATDOCUMENTOS.FIIDTABLA%TYPE                   , 
                                             PAFIORDER                       IN    DIGWEB.CATDOCUMENTOS.FIORDER%TYPE                         , 
                                             PAFCINICIO                      IN    VARCHAR2                                                  ,
                                             PAFCFIN                         IN    VARCHAR2)

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0; 
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

       IF PAFIINOPCION = 1 THEN 

            BEGIN
            
                SELECT 1  
                INTO VFIRESULT 
                FROM DUAL
                WHERE EXISTS (SELECT FIOPEDOCUMENTO                           
                              FROM DIGWEB.CATDOCUMENTOS
                              WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
                                AND FIIDDOCUMENTO=PAFIIDDOCUMENTO
                                AND FISUBPRODUCTO=PAFISUBPRODUCTO
                                AND FIETAPA=PAFIETAPA);
            

                IF VFIRESULT > 0 THEN 

                    OPEN VCursorsalida FOR 
                        SELECT ('El documento ya existe.') MSG FROM DUAL; 
                    RETURN VCursorsalida;             

                END IF; 
            
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
            
                INSERT INTO DIGWEB.CATDOCUMENTOS(FIOPEDOCUMENTO,FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FISTATUS,FIAGREGAPAG,FIETAPA,FISUBPRODUCTO,FIIDTABLA,FIORDER)
                VALUES(PAFIOPEDOCUMENTO,PAFIIDDOCUMENTO,PAFCDESCDOCUMENTO,PAFCDESCCORTA,SYSDATE,PAFCEMPACTUALIZA,PAFISTATUS,PAFIAGREGAPAG,PAFIETAPA,PAFISUBPRODUCTO,PAFIIDTABLA,PAFIORDER); 
                COMMIT; 
                

                OPEN VCursorsalida FOR 
                    SELECT ('Se agrego el documento') MSG FROM DUAL; 
                RETURN VCursorsalida; 
            
            END;

        
        ELSIF PAFIINOPCION = 2 THEN 

            UPDATE DIGWEB.CATDOCUMENTOS SET FCDESCDOCUMENTO = PAFCDESCDOCUMENTO, FCDESCCORTA = PAFCDESCCORTA, FDFECULTACTUALIZACION = SYSDATE, FCEMPACTUALIZA = PAFCEMPACTUALIZA, FISTATUS = PAFISTATUS, FIAGREGAPAG = PAFIAGREGAPAG,
                                            FIIDTABLA = PAFIIDTABLA , FIORDER = PAFIORDER 
            WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
            AND FIIDDOCUMENTO=PAFIIDDOCUMENTO
            AND FISUBPRODUCTO=PAFISUBPRODUCTO
            AND FIETAPA=PAFIETAPA; 
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo el documento') MSG FROM DUAL; 
            RETURN VCursorsalida; 
        
        ELSIF PAFIINOPCION = 3 THEN 

            UPDATE DIGWEB.CATDOCUMENTOS SET FISTATUS = PAFISTATUS, FIIDTABLA = PAFIIDTABLA, FIORDER = PAFIORDER, FDFECULTACTUALIZACION = SYSDATE, FCEMPACTUALIZA = PAFCEMPACTUALIZA 
            WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
            AND FIIDDOCUMENTO=PAFIIDDOCUMENTO
            AND FISUBPRODUCTO=PAFISUBPRODUCTO
            AND FIETAPA=PAFIETAPA; 
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo el documento') MSG FROM DUAL; 
            RETURN VCursorsalida; 
            
            
        ELSIF PAFIINOPCION = 4 THEN 

            UPDATE DIGWEB.CATDOCUMENTOS SET FIIDTABLA = PAFIIDTABLA, FIORDER = PAFIORDER, FDFECULTACTUALIZACION = SYSDATE, FCEMPACTUALIZA = PAFCEMPACTUALIZA 
            WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
            AND FIIDDOCUMENTO=PAFIIDDOCUMENTO
            AND FISUBPRODUCTO=PAFISUBPRODUCTO
            AND FIETAPA=PAFIETAPA; 
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo el documento') MSG FROM DUAL; 
            RETURN VCursorsalida; 
            
            
        ELSIF PAFIINOPCION = 5 THEN 

            DELETE DIGWEB.CATDOCUMENTOS  
            WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
            AND FIIDDOCUMENTO=PAFIIDDOCUMENTO
            AND FISUBPRODUCTO=PAFISUBPRODUCTO
            AND FIETAPA=PAFIETAPA;  
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se elimino el documento') MSG FROM DUAL; 
            RETURN VCursorsalida; 

        ELSIF PAFIINOPCION = 6 THEN 

            DELETE DIGWEB.CATDOCUMENTOS  
            WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
            AND FISUBPRODUCTO=PAFISUBPRODUCTO
            AND FIETAPA=PAFIETAPA;  
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se elimino el documento') MSG FROM DUAL; 
            RETURN VCursorsalida; 

        ELSIF PAFIINOPCION = 7 THEN 

            DELETE DIGWEB.CATDOCUMENTOS  
            WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO;
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se elimino el documento') MSG FROM DUAL; 
            RETURN VCursorsalida; 

        ELSIF PAFIINOPCION = 8 THEN  

            OPEN VCursorsalida FOR 

                SELECT FIOPEDOCUMENTO,FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FISTATUS,FIAGREGAPAG,FIETAPA,FISUBPRODUCTO,FIIDTABLA,FIORDER
                FROM DIGWEB.CATDOCUMENTOS
                WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
                ORDER BY FISUBPRODUCTO,FIETAPA,FIIDDOCUMENTO;             

            RETURN VCursorsalida;   

        ELSIF PAFIINOPCION = 9 THEN  

            OPEN VCursorsalida FOR 

                SELECT FIOPEDOCUMENTO,FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FISTATUS,FIAGREGAPAG,FIETAPA,FISUBPRODUCTO,FIIDTABLA,FIORDER
                FROM DIGWEB.CATDOCUMENTOS
                WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO                 
                  AND FISUBPRODUCTO=PAFISUBPRODUCTO
                  AND FIETAPA=PAFIETAPA
                ORDER BY FIOPEDOCUMENTO,FISUBPRODUCTO,FIETAPA,FIIDDOCUMENTO;              

            RETURN VCursorsalida;   
        
        ELSIF PAFIINOPCION = 10 THEN  

            OPEN VCursorsalida FOR 

                SELECT FIOPEDOCUMENTO,FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FISTATUS,FIAGREGAPAG,FIETAPA,FISUBPRODUCTO,FIIDTABLA,FIORDER
                FROM DIGWEB.CATDOCUMENTOS
                WHERE FIIDDOCUMENTO=PAFIIDDOCUMENTO                 
                ORDER BY FIOPEDOCUMENTO,FISUBPRODUCTO,FIETAPA,FIIDDOCUMENTO;     

            RETURN VCursorsalida;   
            
        ELSIF PAFIINOPCION = 11 THEN  

            OPEN VCursorsalida FOR    

                SELECT FIOPEDOCUMENTO,FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FISTATUS,FIAGREGAPAG,FIETAPA,FISUBPRODUCTO,FIIDTABLA,FIORDER
                FROM DIGWEB.CATDOCUMENTOS 
                WHERE TRUNC(FDFECULTACTUALIZACION,'DDD') BETWEEN TO_DATE (PAFCINICIO,'dd-mm-yyyy')  AND  TO_DATE (PAFCFIN,'dd-mm-yyyy') 
                ORDER BY FIOPEDOCUMENTO; 

            RETURN VCursorsalida;   
            

        END IF; 

        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 



/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGABCWEB.FUNCTION FNDIGABCDIG_UNIDAD_VOLUMEN 
DESCRIPCION: FUNCION QUE REALIZA ALTAS BAJAS MODIFICACIONES Y CONSULTAS DE LA TABLA DIGWEB.DIG_UNIDAD_VOLUMEN
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 17/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
 
 
FUNCTION FNDIGABCDIGUNIDADVOLUMEN         (PAFIINOPCION                    IN    NUMBER                                                    ,
                                         PAUNIDAD                        IN    DIGWEB.DIG_UNIDAD_VOLUMEN.UNIDAD%TYPE                     , 
                                         PARUTA_BASE                     IN    DIGWEB.DIG_UNIDAD_VOLUMEN.RUTA_BASE%TYPE                  , 
                                         PAESTADO_UNIDAD                 IN    DIGWEB.DIG_UNIDAD_VOLUMEN.ESTADO_UNIDAD%TYPE              , 
                                         PATIPO_DISPOSITIVO              IN    DIGWEB.DIG_UNIDAD_VOLUMEN.TIPO_DISPOSITIVO%TYPE           , 
                                         PAFCALIAS                       IN    DIGWEB.DIG_UNIDAD_VOLUMEN.FCALIAS%TYPE                    , 
                                         PAFCRUTASOL                     IN    DIGWEB.DIG_UNIDAD_VOLUMEN.FCRUTASOL%TYPE                  , 
                                         PAFISTATUS                      IN    DIGWEB.DIG_UNIDAD_VOLUMEN.FISTATUS%TYPE                   , 
                                         PAFCALIASSAMBA                  IN    DIGWEB.DIG_UNIDAD_VOLUMEN.FCALIASSAMBA%TYPE)

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0; 
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

        IF PAFIINOPCION = 1 THEN 
        
            BEGIN
            
                SELECT 1  
                INTO VFIRESULT 
                FROM DUAL
                WHERE EXISTS (SELECT UNIDAD
                              FROM DIGWEB.DIG_UNIDAD_VOLUMEN
                              WHERE UNIDAD = PAUNIDAD 
                                AND RUTA_BASE = PARUTA_BASE);     

                IF VFIRESULT > 0 THEN 

                    OPEN VCursorsalida FOR 
                        SELECT ('La unidad ya existe.') MSG FROM DUAL; 
                    RETURN VCursorsalida;            

                END IF; 
                        
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
            
                INSERT INTO DIGWEB.DIG_UNIDAD_VOLUMEN(UNIDAD,RUTA_BASE,ESTADO_UNIDAD,TIPO_DISPOSITIVO,FCALIAS,FCRUTASOL,FISTATUS,FCALIASSAMBA)
                VALUES(PAUNIDAD,PARUTA_BASE,PAESTADO_UNIDAD,PATIPO_DISPOSITIVO,PAFCALIAS,PAFCRUTASOL,PAFISTATUS,PAFCALIASSAMBA); 
                COMMIT; 

                OPEN VCursorsalida FOR 
                    SELECT ('Se agrego la unidad') MSG FROM DUAL; 
                RETURN VCursorsalida; 
            END;

        ELSIF PAFIINOPCION = 2 THEN 
        
            UPDATE DIGWEB.DIG_UNIDAD_VOLUMEN SET UNIDAD = PAUNIDAD , RUTA_BASE = PARUTA_BASE, ESTADO_UNIDAD = PAESTADO_UNIDAD, 
                                                 TIPO_DISPOSITIVO = PATIPO_DISPOSITIVO, FCALIAS = PAFCALIAS, FCRUTASOL = PAFCRUTASOL,
                                                 FISTATUS = PAFISTATUS, FCALIASSAMBA = PAFCALIASSAMBA             
            WHERE UNIDAD = PAUNIDAD 
              AND RUTA_BASE = PARUTA_BASE; 
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo la unidad') MSG FROM DUAL; 
            RETURN VCursorsalida; 

        ELSIF PAFIINOPCION = 3 THEN 

            UPDATE DIGWEB.DIG_UNIDAD_VOLUMEN SET ESTADO_UNIDAD = PAESTADO_UNIDAD,TIPO_DISPOSITIVO = PATIPO_DISPOSITIVO, 
                                                 FCALIAS = PAFCALIAS, FCRUTASOL = PAFCRUTASOL, FISTATUS = PAFISTATUS, 
                                                 FCALIASSAMBA = PAFCALIASSAMBA             
            WHERE UNIDAD = PAUNIDAD 
              AND RUTA_BASE = PARUTA_BASE; 
            COMMIT;

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo la unidad') MSG FROM DUAL; 
            RETURN VCursorsalida; 
       
        ELSIF PAFIINOPCION = 4 THEN 

            UPDATE DIGWEB.DIG_UNIDAD_VOLUMEN SET ESTADO_UNIDAD = PAESTADO_UNIDAD             
            WHERE UNIDAD = PAUNIDAD 
              AND RUTA_BASE = PARUTA_BASE; 
            COMMIT;

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo la unidad') MSG FROM DUAL; 
            RETURN VCursorsalida; 
            
        ELSIF PAFIINOPCION = 5 THEN 

            DELETE DIGWEB.DIG_UNIDAD_VOLUMEN  
            WHERE UNIDAD = PAUNIDAD 
              AND RUTA_BASE = PARUTA_BASE;  
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se elimino la unidad') MSG FROM DUAL; 
            RETURN VCursorsalida; 

        ELSIF PAFIINOPCION = 6 THEN  

            OPEN VCursorsalida FOR 

                SELECT UNIDAD,RUTA_BASE,ESTADO_UNIDAD,TIPO_DISPOSITIVO,FCALIAS,FCRUTASOL,FISTATUS,FCALIASSAMBA
                FROM DIGWEB.DIG_UNIDAD_VOLUMEN
                WHERE UNIDAD = PAUNIDAD 
                  AND RUTA_BASE = PARUTA_BASE;            

            RETURN VCursorsalida;  

        ELSIF PAFIINOPCION = 7 THEN  

            OPEN VCursorsalida FOR    

                SELECT UNIDAD,RUTA_BASE,ESTADO_UNIDAD,TIPO_DISPOSITIVO,FCALIAS,FCRUTASOL,FISTATUS,FCALIASSAMBA
                FROM DIGWEB.DIG_UNIDAD_VOLUMEN 
                WHERE UNIDAD LIKE '%' || PAUNIDAD || '%' 
                ORDER BY UNIDAD;              

            RETURN VCursorsalida;               


        ELSIF PAFIINOPCION = 8 THEN  

            OPEN VCursorsalida FOR    

                SELECT UNIDAD,RUTA_BASE,ESTADO_UNIDAD,TIPO_DISPOSITIVO,FCALIAS,FCRUTASOL,FISTATUS,FCALIASSAMBA
                FROM DIGWEB.DIG_UNIDAD_VOLUMEN 
                WHERE  ESTADO_UNIDAD = PAESTADO_UNIDAD
                ORDER BY UNIDAD; 

            RETURN VCursorsalida;    
            
        ELSIF PAFIINOPCION = 9 THEN  

            OPEN VCursorsalida FOR    

                SELECT (FCRUTASOL || '/' || (SUBSTR(RUTA_BASE,0,LENGTH(RUTA_BASE)-1)) || '/' || TO_CHAR(SYSDATE,'yyyymm') || '/') RUTABASE
                FROM DIGWEB.DIG_UNIDAD_VOLUMEN 
                WHERE  ESTADO_UNIDAD = PAESTADO_UNIDAD
                ORDER BY UNIDAD; 

            RETURN VCursorsalida;                                                                          

        END IF; 

        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 

 
END PKDIGABCWEB;
/


--
-- PKDIGITALIZADOCTOS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGITALIZADOCTOS AS
/***********************************************************************************************

NAME: DIGWEB.PKDIGITALIZADOCTOS
DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN PARA LA DIGITALIZACION POR WEB
AUTOR: ARMANDO OSORIO HERNANDEZ
FECHA CREACION: 11/08/2010
FECHA ACTUALIZACION 
VERSION: 1.0
FECHA MODIFICACION:
NOTAS:
************************************************************************************************/


/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGGENERAEXPEDIENTE
DESCRIPCION: FUNCION QUE OBTIENE EL EXPIMX DEL PRODUCTO, SI NO EXISTE LO CREA
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 11/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 

FUNCTION FNDIGGENERAEXPEDIENTE         (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,                                         
                                        PAIMX02                         IN    DIGWEB.IMX01.IMX02%TYPE                                   , 
                                        PAIMX03                         IN    DIGWEB.IMX01.IMX03%TYPE                                   , 
                                        PAIMX04                         IN    DIGWEB.IMX01.IMX04%TYPE                                   , 
                                        PAIMX05                         IN    DIGWEB.IMX01.IMX05%TYPE                                   , 
                                        PAIMX06                         IN    DIGWEB.IMX01.IMX06%TYPE                                   , 
                                        PAIMX07                         IN    DIGWEB.IMX01.IMX07%TYPE                                   , 
                                        PAIMX08                         IN    DIGWEB.IMX01.IMX08%TYPE                                   , 
                                        PAIMX09                         IN    DIGWEB.IMX01.IMX09%TYPE                                   , 
                                        PAIMX10                         IN    DIGWEB.IMX01.IMX10%TYPE                                   ,                                         
                                        PAIMX11                         IN    DIGWEB.IMX01.IMX11%TYPE                                   , 
                                        PAIMX12                         IN    DIGWEB.IMX01.IMX12%TYPE                                   , 
                                        PAIMX13                         IN    DIGWEB.IMX01.IMX13%TYPE                                   , 
                                        PAIMX14                         IN    DIGWEB.IMX01.IMX14%TYPE                                   , 
                                        PAIMX15                         IN    DIGWEB.IMX01.IMX15%TYPE                                   , 
                                        PAIMX16                         IN    DIGWEB.IMX01.IMX16%TYPE                                   , 
                                        PAIMX17                         IN    DIGWEB.IMX01.IMX17%TYPE                                   , 
                                        PAIMX18                         IN    DIGWEB.IMX01.IMX18%TYPE                                   , 
                                        PAIMX19                         IN    DIGWEB.IMX01.IMX19%TYPE                                   , 
                                        PAIMX20                         IN    DIGWEB.IMX01.IMX20%TYPE                                   , 
                                        PAFCCLIENTEUNICO                IN    DIGWEB.IMX01.FCCLIENTEUNICO%TYPE                          , 
                                        PAFIDOMICILIA                   IN    DIGWEB.IMX01.FIDOMICILIA%TYPE                             , 
                                        PAFISUCURSALDOM                 IN    DIGWEB.IMX01.FISUCURSALDOM%TYPE)

RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

TYPE VARRIMXS IS VARRAY(20) OF  VARCHAR2(64);

VFCLLAVE                        VARCHAR2(64); 
--VFCAPPIMX                       VARCHAR2(50);
VFCMSG                          VARCHAR2(300);

VFIEXPIMX                       NUMBER;
VFIERROR                        NUMBER;

VARRIMX VARRIMXS;

BEGIN     
    BEGIN
    
        --VFIEXPIMX := 0;
        VARRIMX := VARRIMXS();
        VARRIMX.EXTEND(20);     
        
        VARRIMX(2)  := PAIMX02;
        VARRIMX(3)  := PAIMX03;
        VARRIMX(4)  := PAIMX04;
        VARRIMX(5)  := PAIMX05;
        VARRIMX(6)  := PAIMX06;
        VARRIMX(7)  := PAIMX07;
        VARRIMX(8)  := PAIMX08;
        VARRIMX(9)  := PAIMX09;
        VARRIMX(10) := PAIMX10;
        VARRIMX(11) := PAIMX11;
        VARRIMX(12) := PAIMX12;
        VARRIMX(13) := PAIMX13;
        VARRIMX(14) := PAIMX14;
        VARRIMX(15) := PAIMX15;
        VARRIMX(16) := PAIMX16;
        VARRIMX(17) := PAIMX17;
        VARRIMX(18) := PAIMX18;
        VARRIMX(19) := PAIMX19;
        VARRIMX(20) := PAIMX20;

            
         FOR FILA IN 
                 (SELECT FCCLUMNA 
                  FROM DIGWEB.TASERVCOLUMN
                  WHERE FCDESCSERV = PAFCAPPIMX 
                    AND FCTIPOCOLUMNA = 'K'
                  ORDER BY FCDESCSERV,FCCLUMNA)
            
         LOOP
       
            VFCLLAVE := VFCLLAVE || VARRIMX(TO_NUMBER(SUBSTR(FILA.FCCLUMNA,4))) || '-';         
      
         END LOOP;  
    
    
         VFCLLAVE := RTRIM(SUBSTR(VFCLLAVE,0,(LENGTH(VFCLLAVE)-1)));

                
        BEGIN
                
            SELECT EXPIMX
            INTO VFIEXPIMX
            FROM DIGWEB.IMX01
            WHERE APPIMX = PAFCAPPIMX
              AND IMX01 = VFCLLAVE;
            
            IF SQL%ROWCOUNT > 0 THEN
            
                UPDATE DIGWEB.IMX01 SET FDMODIFICACION = SYSDATE
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = VFIEXPIMX;                
                COMMIT;
                
                OPEN VCursorsalida FOR
                    SELECT PAFCAPPIMX  APPIMX, VFIEXPIMX  EXPIMX, VFCLLAVE IMX01 FROM DUAL;
                RETURN VCursorsalida;
                
            END IF;
            
            EXCEPTION
            WHEN NO_DATA_FOUND THEN            
            
                SELECT NVL(MAX(EXPIMX),0) + 1 TOTAL
                INTO VFIEXPIMX
                FROM DIGWEB.IMX01
                WHERE APPIMX = PAFCAPPIMX;
                
                INSERT INTO DIGWEB.IMX01 (APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,IMX11,IMX12,IMX13,IMX14,IMX15,IMX16,IMX17,IMX18,IMX19,IMX20,FCCLIENTEUNICO,FIDOMICILIA,FISUCURSALDOM,FDALTA)
                                  VALUES (PAFCAPPIMX,VFIEXPIMX,0,'N',VFCLLAVE,PAIMX02,PAIMX03,PAIMX04,PAIMX05,PAIMX06,PAIMX07,PAIMX08,PAIMX09,PAIMX10,PAIMX11,PAIMX12,PAIMX13,PAIMX14,PAIMX15,PAIMX16,PAIMX17,PAIMX18,PAIMX19,PAIMX20,PAFCCLIENTEUNICO,PAFIDOMICILIA,PAFISUCURSALDOM,SYSDATE);
                COMMIT;                                                
            
                OPEN VCursorsalida FOR
                    SELECT PAFCAPPIMX  APPIMX, VFIEXPIMX  EXPIMX, VFCLLAVE IMX01 FROM DUAL;
                RETURN VCursorsalida;
                        
            WHEN OTHERS THEN        
                VFIERROR := 1;
                VFCMSG := SQLERRM;
                        
        END;             
   
     EXCEPTION            
        WHEN OTHERS THEN
                
            VFIERROR := 1;
            VFCMSG := SQLERRM;
            
    END;
    
    IF VFIERROR = 1 THEN
        ROLLBACK;
            OPEN VCursorsalida FOR
                SELECT (VFCMSG || ' - ROLLBACK') APPIMX, 0 EXPIMX,'ERROR' IMX01 FROM DUAL;
            RETURN VCursorsalida;
    END IF;        
            
EXCEPTION
WHEN OTHERS THEN        
    VFCMSG := SQLERRM;
    OPEN VCursorsalida FOR
         SELECT VFCMSG APPIMX, 0 EXPIMX,'' IMX01 FROM DUAL;
    RETURN VCursorsalida;

END;
              

/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGOBTIENEDOCTOS
DESCRIPCION: FUNCION QUE OBTIENE LOS DOCUMENTOS DE UN EXPEDIENTE Y SU ESTATUS DEPEDIENTO DE LA ETAPA
            Y SUBPRODUCTO
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 11/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGOBTIENEDOCTOS            (PAFIOPEDOCUMENTO                IN    NUMBER                                                   ,                                         
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                          , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                                , 
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE )
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

VFCMSG                          VARCHAR2(300);
VFCAPPIMX                       VARCHAR2(50);
  
BEGIN   

        
    SELECT RTRIM(FCDESCOPERADOCTO)
    INTO VFCAPPIMX
    FROM DIGWEB.CATOPERADOCTOS
    WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO;
    
    IF SQL%ROWCOUNT > 0 THEN   

        OPEN VCursorsalida FOR
               
            SELECT C.FIIDDOCUMENTO,C.FCDESCDOCUMENTO,C.FIIDTABLA,C.FISTATUS AS FIOBLIGATORIO, 
                   CASE WHEN X2.IDDOCIMX IS NULL THEN 0 ELSE 1 END AS FIDIGITALIZADO,FIORDER,H.DESCTITULO FCDESCTITULO
            FROM DIGWEB.CATDOCUMENTOS C 
                INNER JOIN DIGWEB.DESCHEADERS H 
                    ON H.IDTABLA = C.FIIDTABLA 
                LEFT OUTER JOIN DIGWEB.IMX02 X2
                    ON  X2.APPIMX = CAST(VFCAPPIMX AS CHAR(16))
                    AND X2.EXPIMX = PAEXPIMX
                    AND X2.IDDOCIMX = C.FIIDDOCUMENTO
                    AND X2.FISUBPRODUCTO = C.FISUBPRODUCTO
                    AND X2.FIETAPA = C.FIETAPA 
                    AND X2.STATUSIMX = 1
            WHERE  C.FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
               AND C.FISUBPRODUCTO = PASUBPRODUCTO
               AND C.FIETAPA = PAETAPA 
            ORDER BY FISTATUS,FIORDER;  
        
        RETURN VCursorsalida;        

    END IF;
   
 EXCEPTION
    WHEN NO_DATA_FOUND THEN        
            
        OPEN VCursorsalida FOR
             SELECT 0 FIIDDOCUMENTO,'' FCDESCDOCUMENTO, 0 FIIDTABLA,0 FIOBLIGATORIO, 0 FIDIGITALIZADO, 0 FIORDER,'' FCDESCTITULO
             FROM DUAL;
        RETURN VCursorsalida;    
            
    WHEN OTHERS THEN
        
        VFCMSG := SQLERRM;
            
        OPEN VCursorsalida FOR
             SELECT VFCMSG MSG FROM DUAL;
        RETURN VCursorsalida;
    
            
END;

/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGBORRAPAGINA
DESCRIPCION: FUNCION QUE REALIZAE EL BORRADO DE PAGINAS DE UN EXPEDIENTE
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 11/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGBORRAPAGINA              (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                ,  
                                        PADOCIMX                        IN    DIGWEB.IMX02.DOCIMX%TYPE                                ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                               ,
                                        PAUSUARIO                       IN    DIGWEB.IMX03.USUARIOIMX%TYPE                            ,
                                        PAWS                            IN    DIGWEB.IMX03.WSIMX%TYPE                                 ,
                                        PANUMPAG                        IN    NUMBER                                                  ,
                                        PANOMBREPAG                     IN    DIGWEB.IMX03.IMGIMX%TYPE                                ,
                                        PARUTAPAG                       IN    DIGWEB.IMX03.RUTIMX%TYPE )
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

--VFCAPPIMX                       VARCHAR2(50);
VFIIMX02DOCIMX                  NUMBER;
VFIIMX03PAG                     NUMBER; 
VFICONTADORPAG                  NUMBER;
VFICONTADOR                     NUMBER;
VFCMSG                          VARCHAR2(300);
VFIERROR                        NUMBER;


BEGIN

   BEGIN 
             
        SELECT DOCIMX
        INTO VFIIMX02DOCIMX
        FROM DIGWEB.IMX02
        WHERE APPIMX = PAFCAPPIMX
          AND EXPIMX = PAEXPIMX
          AND IDDOCIMX = PADOCIMX
          AND FISUBPRODUCTO = PASUBPRODUCTO
          AND FIETAPA = PAETAPA
          AND STATUSIMX = 1;
              
            
       SELECT PAGIMX
       INTO VFIIMX03PAG
       FROM(              
            SELECT ROWNUM LISTA,PAGIMX
            FROM DIGWEB.IMX03
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAEXPIMX
              AND DOCIMX = VFIIMX02DOCIMX
              AND FISUBPRODUCTO = PASUBPRODUCTO
              AND FIETAPA = PAETAPA
              AND STATUSIMX = 1
            ORDER BY PAGIMX
            )
        WHERE LISTA = PANUMPAG;
            
        UPDATE DIGWEB.IMX03 
        SET STATUSIMX = 0,
            USUARIOIMX = PAUSUARIO,
            WSIMX = PAWS,
            IMGIMX = PANOMBREPAG,
            RUTIMX = PARUTAPAG,
            FECDICIMX = SYSDATE
        WHERE APPIMX = PAFCAPPIMX 
              AND EXPIMX = PAEXPIMX
              AND DOCIMX = VFIIMX02DOCIMX
              AND FISUBPRODUCTO = PASUBPRODUCTO
              AND FIETAPA = PAETAPA
              AND PAGIMX = VFIIMX03PAG;
            
        SELECT COUNT(APPIMX)
        INTO VFICONTADORPAG
        FROM DIGWEB.IMX03
        WHERE APPIMX = PAFCAPPIMX 
          AND EXPIMX = PAEXPIMX
          AND DOCIMX = VFIIMX02DOCIMX
          AND FISUBPRODUCTO = PASUBPRODUCTO
          AND FIETAPA = PAETAPA
          AND STATUSIMX = 1;
              
              
         IF VFICONTADORPAG = 0 THEN             
             
            UPDATE DIGWEB.IMX02
            SET STATUSIMX = 0
            WHERE APPIMX = PAFCAPPIMX 
              AND EXPIMX = PAEXPIMX
              AND DOCIMX = VFIIMX02DOCIMX
              AND FISUBPRODUCTO = PASUBPRODUCTO
              AND FIETAPA = PAETAPA;                 

                 
             SELECT COUNT(APPIMX)
             INTO VFICONTADOR
             FROM DIGWEB.IMX02
             WHERE APPIMX = PAFCAPPIMX 
               AND EXPIMX = PAEXPIMX
               AND STATUSIMX = 1;
                  
             IF VFICONTADOR = 0 THEN
                 
              UPDATE DIGWEB.IMX01
                SET EDOIMX = 'N'
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX;   
                  
             END IF;
             
         END IF;
   
   
   EXCEPTION
    WHEN OTHERS THEN 
        VFCMSG := SQLERRM;
        VFIERROR := 1;
                          
   END;  
    
    IF VFIERROR = 1 THEN
      ROLLBACK;
       OPEN VCursorsalida FOR
         SELECT 'E' MSG, VFCMSG FCCAUSA
          FROM DUAL;
       RETURN VCursorsalida;
    ELSE
     COMMIT;
       OPEN VCursorsalida FOR
        SELECT 'OK' MSG,'OK' FCCAUSA
         FROM DUAL;
         RETURN VCursorsalida;
    END IF;
    
    EXCEPTION
    WHEN OTHERS THEN 
        OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCMSG) MSG,'ERROR' FCCAUSA  FROM DUAL;
        RETURN VCursorsalida;

END;

/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGCAMBIASTEXP
DESCRIPCION: FUNCION QUE REALIZA LA ACTUALIZACION DEL EXPEDIENTE A M
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 16/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGCAMBIASTEXP              (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE)
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

VFCAPPIMX                       VARCHAR2(50);
VFCMSG                          VARCHAR2(300);
VFIERROR                        NUMBER;


BEGIN     
    
    BEGIN

        UPDATE DIGWEB.IMX01
         SET EDOIMX = 'M'
        WHERE APPIMX = PAFCAPPIMX
          AND EXPIMX = PAEXPIMX;
          
    EXCEPTION
        WHEN OTHERS THEN 
            VFCMSG := SQLERRM;
            VFIERROR := 1;
    
    END;
        
    IF VFIERROR = 1 THEN
      ROLLBACK;
       OPEN VCursorsalida FOR
         SELECT 'ERROR' MSG, VFCMSG FCCAUSA
          FROM DUAL;
       RETURN VCursorsalida;
    ELSE
     COMMIT;
       OPEN VCursorsalida FOR
        SELECT 'CORRECTO' MSG,'OK' FCCAUSA
         FROM DUAL;
         RETURN VCursorsalida;
    END IF;
    
    EXCEPTION
    WHEN OTHERS THEN 
        OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCMSG) MSG FROM DUAL;
        RETURN VCursorsalida;

    END;            


/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGBORRAPAGINA
DESCRIPCION: FUNCION QUE OBTIENE TODAS LAS PAGINAS DE UN DOCUMENTO
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 16/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGOBTIENEPAG               (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                                  ,
                                        PADOCIMX                        IN    DIGWEB.IMX02.IDDOCIMX%TYPE                                ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE)
 
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

--VFCAPPIMX                       VARCHAR2(50);
VFIIMX02DOCIMX                  NUMBER;
VFICONTADOR                     NUMBER;
VFCMSG                          VARCHAR2(300);
VFIERROR                        NUMBER;


BEGIN   
        
   BEGIN 
             
        SELECT DOCIMX
        INTO VFIIMX02DOCIMX
        FROM DIGWEB.IMX02
        WHERE APPIMX = PAFCAPPIMX
          AND EXPIMX = PAEXPIMX
          AND IDDOCIMX = PADOCIMX
          AND FISUBPRODUCTO = PASUBPRODUCTO
          AND FIETAPA = PAETAPA
          AND STATUSIMX = 1;
           
        OPEN VCursorsalida FOR
            SELECT COUNT(APPIMX) TOTAL
            FROM DIGWEB.IMX03
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAEXPIMX
              AND DOCIMX = VFIIMX02DOCIMX
              AND FISUBPRODUCTO = PASUBPRODUCTO
              AND FIETAPA = PAETAPA
              AND STATUSIMX = 1;
        RETURN VCursorsalida; 
        
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            VFCMSG := 'No existe el documento';
            VFIERROR := 1;   
    
        WHEN OTHERS THEN        
                VFCMSG := SQLERRM;
                VFIERROR := 1;  
    END;  
  
    IF VFIERROR = 1 THEN
          
       OPEN VCursorsalida FOR
         SELECT 0 TOTAL, VFCMSG MSG
          FROM DUAL;
       RETURN VCursorsalida;
    
    END IF;
   
    EXCEPTION 
        WHEN OTHERS THEN 
        OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCMSG) MSG FROM DUAL;
        RETURN VCursorsalida;
            
END;



/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGBORRAPAGINA
DESCRIPCION: FUNCION QUE OBTIENE TODAS LAS RUTAS DE UN DOCUMENTO
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 16/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGOBTIENERUTA              (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                                  ,
                                        PADOCIMX                        IN    DIGWEB.IMX02.IDDOCIMX%TYPE                              ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE)
 
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

--VFCAPPIMX                       VARCHAR2(50);
VFIIMX02DOCIMX                  NUMBER;
VFICONTADOR                     NUMBER;
VFCMSG                          VARCHAR2(300);
VFIERROR                        NUMBER;


BEGIN   
        
   BEGIN 
             
        SELECT DOCIMX
        INTO VFIIMX02DOCIMX
        FROM DIGWEB.IMX02
        WHERE APPIMX = PAFCAPPIMX
          AND EXPIMX = PAEXPIMX
          AND IDDOCIMX = PADOCIMX
          AND FISUBPRODUCTO = PASUBPRODUCTO
          AND FIETAPA = PAETAPA
          AND STATUSIMX = 1;
           
        OPEN VCursorsalida FOR
            SELECT RUTIMX
            FROM DIGWEB.IMX03
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAEXPIMX
              AND DOCIMX = VFIIMX02DOCIMX
              AND FISUBPRODUCTO = PASUBPRODUCTO
              AND FIETAPA = PAETAPA
              AND STATUSIMX = 1;
        RETURN VCursorsalida; 
        
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            VFCMSG := 'No existe el documento';
            VFIERROR := 1;   
    
        WHEN OTHERS THEN        
                VFCMSG := SQLERRM;
                VFIERROR := 1;  
    END;  
  
    IF VFIERROR = 1 THEN
          
       OPEN VCursorsalida FOR
         SELECT 0 TOTAL, VFCMSG MSG
          FROM DUAL;
       RETURN VCursorsalida;
    
    END IF;
   
    EXCEPTION 
        WHEN OTHERS THEN 
        OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCMSG) MSG FROM DUAL;
        RETURN VCursorsalida;
END;


/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGBORRAPAGINA
DESCRIPCION: FUNCION QUE OBTIENE EL EXPIMX
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 16/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGGETEXPIMX               (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                       PAIMX01                         IN    DIGWEB.IMX01.IMX01%TYPE)
 
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 
VFCMSG                          VARCHAR2(300);
VFEXPIMX                        NUMBER;

BEGIN  
    
    SELECT EXPIMX
    INTO VFEXPIMX
    FROM DIGWEB.IMX01
    WHERE APPIMX = PAFCAPPIMX
     AND IMX01 = PAIMX01;     
    
    OPEN VCursorsalida FOR
        SELECT VFEXPIMX EXPIMX
        FROM DUAL;           
    RETURN VCursorsalida;
   
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
         
            OPEN VCursorsalida FOR
                SELECT 0 EXPIMX, 'No existe el expediente' MSG
                FROM DUAL;           
            RETURN VCursorsalida; 
            
        WHEN OTHERS THEN
        VFCMSG := SQLERRM;
            OPEN VCursorsalida FOR
                SELECT 0 EXPIMX, VFCMSG MSG
                FROM DUAL;           
            RETURN VCursorsalida; 
    
END;    



/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGBORRAPAGINA
DESCRIPCION: FUNCION QUE CREAD DOCUMENTO, AGREGA PAGINAS A DOCUMENTO 
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 17/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGGRABADOCTO               (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                ,
                                        PAIDDOCIMX                      IN    DIGWEB.IMX02.IDDOCIMX%TYPE                              ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                               ,
                                        PAUSUARIO                       IN    DIGWEB.IMX03.USUARIOIMX%TYPE                            ,
                                        PAWS                            IN    DIGWEB.IMX03.WSIMX%TYPE                                 ,
                                        PAIMX01                         IN    DIGWEB.IMX01.IMX01%TYPE                                 ,  
                                        PAFCCARPETABASE                 IN    VARCHAR2                                                ,
                                        PAEXTENSIONARCH                 IN    VARCHAR2)
 
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 


VFCRUTABASE                     VARCHAR2(300);
VFCRUTA1                        VARCHAR2(512);
VFCRUTA2                        VARCHAR2(512);
VFCMSG                          VARCHAR2(300);
VFCDESCDOCTO                    VARCHAR(64);
VFCNOMARCH                      VARCHAR(64);

VFIERROR                        NUMBER;
VFIIDDOCIMX                     NUMBER;
VFIPAGINASIG                    NUMBER;
VFINOMPAG                      NUMBER;



BEGIN  

    BEGIN  
        
        SELECT FCDESCDOCUMENTO
        INTO VFCDESCDOCTO
        FROM DIGWEB.CATDESCDOCUMENTOS
        WHERE FIIDDOCUMENTO = PAIDDOCIMX;

        IF SQL%ROWCOUNT > 0 THEN
        
           BEGIN
           
                SELECT DOCIMX
                INTO VFIIDDOCIMX
                FROM DIGWEB.IMX02
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX
                  AND IDDOCIMX = PAIDDOCIMX
                  AND FISUBPRODUCTO = PASUBPRODUCTO
                  AND FIETAPA = PAETAPA;
                  
                  UPDATE DIGWEB.IMX02
                  SET STATUSIMX = 1
                  WHERE APPIMX = PAFCAPPIMX 
                   AND EXPIMX = PAEXPIMX
                   AND DOCIMX = VFIIDDOCIMX
                   AND FISUBPRODUCTO = PASUBPRODUCTO
                   AND FIETAPA = PAETAPA;
                  
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    BEGIN
                        SELECT NVL(MAX(DOCIMX),0)+1
                        INTO VFIIDDOCIMX
                        FROM DIGWEB.IMX02
                        WHERE APPIMX = PAFCAPPIMX 
                          AND EXPIMX = PAEXPIMX;
                      
                        INSERT INTO DIGWEB.IMX02 
                              (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA)
                        VALUES(PAFCAPPIMX,PAEXPIMX,VFIIDDOCIMX,PAIDDOCIMX,VFCDESCDOCTO,1,PASUBPRODUCTO,PAETAPA);
                    END;  
           END; 
           
           BEGIN 
             
                SELECT NVL(MAX(PAGIMX),0)+1
                INTO VFIPAGINASIG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX
                  AND DOCIMX = VFIIDDOCIMX
                  AND FISUBPRODUCTO = PASUBPRODUCTO
                  AND FIETAPA = PAETAPA;
                  
                SELECT NVL(MAX(ROWNUM),0)+1
                INTO VFINOMPAG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX
                  AND DOCIMX = VFIIDDOCIMX
                  AND FISUBPRODUCTO = PASUBPRODUCTO
                  AND FIETAPA = PAETAPA
                  AND STATUSIMX = 1;
                  
                  
                VFCRUTABASE := DIGWEB.PKDIGITALIZADOCTOS.FNDIGRUTABASE(PAFCAPPIMX,PAEXPIMX,PAFCCARPETABASE);
                
                VFCNOMARCH := TO_CHAR(PAEXPIMX) || LPAD(TO_CHAR(VFINOMPAG),4,0) || '.' ||PAEXTENSIONARCH;
                
                VFCRUTA1 :=  VFCRUTABASE || PAIMX01 || '/'|| PAIMX01 || '-' || PASUBPRODUCTO || '-' || PAETAPA || '/' || PAIDDOCIMX || '/';
                 
                VFCRUTA2 := VFCRUTA1 || VFCNOMARCH;
                
                INSERT INTO DIGWEB.IMX03
                (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX)
                VALUES(PAFCAPPIMX,PAEXPIMX,VFIIDDOCIMX,VFIPAGINASIG,VFCNOMARCH,VFCRUTA2,1,PASUBPRODUCTO,PAETAPA,PAUSUARIO,PAWS,SYSDATE);

           END;           
           
        END IF;
   
        EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        BEGIN 
            VFCMSG := 'No existe el documento';
            VFIERROR := 1;   
        END;
            
        WHEN OTHERS THEN
        BEGIN    
            VFCMSG := SQLERRM;
            VFIERROR := 1;
        END;
    
    END;
    
    IF VFIERROR = 1 THEN
      ROLLBACK;
       OPEN VCursorsalida FOR
         SELECT '' R1, '' R2, VFCMSG MSG
          FROM DUAL;
       RETURN VCursorsalida;
    ELSE
     COMMIT;
       OPEN VCursorsalida FOR
        SELECT VFCRUTA1 R1, VFCRUTA2 R2, 'OK' MSG
         FROM DUAL;
         RETURN VCursorsalida;
    END IF;
    
    EXCEPTION 
        WHEN OTHERS THEN 
        VFCMSG := SQLERRM;
        OPEN VCursorsalida FOR
            SELECT '' R1, '' R2, VFCMSG MSG
            FROM DUAL;
        RETURN VCursorsalida;            
            
END;


/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGRUTABASE
DESCRIPCION: FUNCION QUE OBTIENE LA RUTA BASE DEL EXPEDIENTE TOMANDO EN CUENTA EL SHARED ACTIVO
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 16/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGRUTABASE                 (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                                  ,
                                        PAFCCARPETABASE                 IN    VARCHAR2)                  
 
                                        
RETURN VARCHAR2

IS

VFCMSG                          VARCHAR2(300);
VFCRUTABASE                     VARCHAR2(300);

VFCRUTASOL                      VARCHAR2(64);
VFCCRUTABASE                    VARCHAR2(16);

BEGIN   
        
   BEGIN 
             
        SELECT (SUBSTR(RUTIMX,0,INSTR(RUTIMX,RTRIM(PAFCAPPIMX))-1) || PAFCAPPIMX || '/') RUTABASE  
        INTO  VFCRUTABASE    
        FROM DIGWEB.IMX03
        WHERE APPIMX = PAFCAPPIMX
          AND EXPIMX = PAEXPIMX
          AND ROWNUM = 1;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        
            SELECT RTRIM(FCRUTASOL),RTRIM(RUTA_BASE)
            INTO  VFCRUTASOL,VFCCRUTABASE  
            FROM DIGWEB.DIG_UNIDAD_VOLUMEN 
            WHERE  ESTADO_UNIDAD = 1
            ORDER BY UNIDAD; 
            
            IF(VFCRUTASOL = '/RESPALDOS2') THEN
            
                VFCRUTABASE := VFCRUTASOL || '/' ||  PAFCCARPETABASE || '/' || TO_CHAR(SYSDATE,'yyyymm') || '/' || PAFCAPPIMX || '/' ; 
            
            ELSE
                
                VFCRUTABASE := VFCRUTASOL || '/' || (SUBSTR(VFCCRUTABASE,0,LENGTH(VFCCRUTABASE)-1)) || '/' || PAFCCARPETABASE || '/' || TO_CHAR(SYSDATE,'yyyy') || '/' || TO_CHAR(SYSDATE,'mm') || '/' || TO_CHAR(SYSDATE,'dd') || '/' || PAFCAPPIMX || '/' ; 
                    
            END IF;
    END;    
      
    RETURN VFCRUTABASE;
        
    EXCEPTION        
        WHEN OTHERS THEN
        VFCMSG := SQLERRM; 
        RETURN VFCMSG;
END;



/***********************************************************************************************  
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGOBTIENEDOCTOSBASE
DESCRIPCION: FUNCION QUE OBTIENE LOS DOCUMENTOS DE UN EXPEDIENTE Y SU ESTATUS DEPEDIENTO DE LA ETAPA
            Y SUBPRODUCTO.
            OBTIENE TODOS LOS DOCUMENTOS BASE DE UN CLIENTE UNICO Y SI YA ESTAN DIGITALIZADOS EN OTRO 
            EXPEDIENTE DEL CLEINTE UNICO LOS MARCA COMO DIGITALIZADOS..
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 11/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGOBTIENEDOCTOSBASE        (PAFIOPEDOCUMENTO                IN    NUMBER                                                   ,                                        
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                 ,
                                        PAFCCLIENTEUNICO                IN    DIGWEB.IMX01.FCCLIENTEUNICO%TYPE                         , 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                          , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE)
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

VFCMSG                          VARCHAR2(300);
VFCAPPIMX                       VARCHAR2(50);
  
BEGIN   

        
    SELECT RTRIM(FCDESCOPERADOCTO)
    INTO VFCAPPIMX
    FROM DIGWEB.CATOPERADOCTOS
    WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO;
    
    IF SQL%ROWCOUNT > 0 THEN   

        OPEN VCursorsalida FOR               



            SELECT  T.FIIDDOCUMENTO,T.FCDESCDOCUMENTO,T.FIIDTABLA,T.FIOBLIGATORIO,
                    CASE WHEN( 
                    CASE WHEN T.FIDIGITALIZADO IS NULL THEN 0 
                         WHEN T.FIDIGITALIZADO = 0 THEN 0
                         ELSE 1 END + 
                    CASE WHEN T2.IDDOCIMX IS NULL THEN 0 
                         WHEN T2.IDDOCIMX = 0 THEN 0
                         ELSE 1 END ) = 0 THEN 0 ELSE 1 END AS FIDIGITALIZADO,T.FIORDER,T.FCDESCTITULO
            FROM
                (
                    SELECT C.FIIDDOCUMENTO,C.FCDESCDOCUMENTO,C.FIIDTABLA,C.FISTATUS AS FIOBLIGATORIO, 
                           CASE WHEN X2.IDDOCIMX IS NULL THEN 0 ELSE 1 END AS FIDIGITALIZADO,FIORDER,H.DESCTITULO FCDESCTITULO
                    FROM DIGWEB.CATDOCUMENTOS C 
                        INNER JOIN DIGWEB.DESCHEADERS H 
                            ON H.IDTABLA = C.FIIDTABLA 
                        LEFT OUTER JOIN DIGWEB.IMX02 X2
                            ON  X2.APPIMX = CAST(VFCAPPIMX AS CHAR(16))
                            AND X2.EXPIMX = PAEXPIMX
                            AND X2.IDDOCIMX = C.FIIDDOCUMENTO
                            AND X2.FISUBPRODUCTO = C.FISUBPRODUCTO
                            AND X2.FIETAPA = C.FIETAPA 
                            AND X2.STATUSIMX = 1
                    WHERE  C.FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
                       AND C.FISUBPRODUCTO = PASUBPRODUCTO
                       AND C.FIETAPA = 1  
                ) T
            LEFT OUTER JOIN           
                (
                    SELECT DISTINCT X2.IDDOCIMX
                    FROM DIGWEB.IMX02 X2
                    INNER JOIN DIGWEB.DOCTOSBASE BA ON BA.FIDDOCUMENTO = X2.IDDOCIMX
                    WHERE X2.APPIMX = CAST(VFCAPPIMX AS CHAR(16))
                      AND X2.EXPIMX IN (
                                        SELECT X1.EXPIMX
                                        FROM DIGWEB.IMX01 X1
                                        WHERE X1.FCCLIENTEUNICO = PAFCCLIENTEUNICO
                                       )
                      AND X2.FISUBPRODUCTO = PASUBPRODUCTO
                      AND X2.FIETAPA = PAETAPA
                      AND X2.STATUSIMX = 1                   
                ) T2 ON T2.IDDOCIMX = T.FIIDDOCUMENTO   
                ORDER BY FIORDER;
            
        RETURN VCursorsalida;        

    END IF;
   
 EXCEPTION
    WHEN NO_DATA_FOUND THEN        
            
        OPEN VCursorsalida FOR
             SELECT 0 FIIDDOCUMENTO,'' FCDESCDOCUMENTO, 0 FIIDTABLA,0 FIOBLIGATORIO, 0 FIDIGITALIZADO, 0 FIORDER,'' FCDESCTITULO
             FROM DUAL;
        RETURN VCursorsalida;    
            
    WHEN OTHERS THEN
        
        VFCMSG := SQLERRM;
            
        OPEN VCursorsalida FOR
             SELECT VFCMSG MSG FROM DUAL;
        RETURN VCursorsalida;
    
            
END;

/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGACTSTATUSEXP
DESCRIPCION: FUNCION QUE REALIZA LA ACTUALIZACION DEL EXPEDIENTE A PASTATUS
AUTOR: EDGAR TELLO HERNANDEZ 
FECHA CREACION: 03/01/2011 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDIGACTSTATUSEXP              (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAIMX01                        IN    DIGWEB.IMX01.IMX01%TYPE,
                                        PAEDOIMX                 IN    DIGWEB.IMX01.EDOIMX%TYPE)
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

VFCAPPIMX                       VARCHAR2(50);
VFCMSG                          VARCHAR2(300);
VFIERROR                        NUMBER;


BEGIN     
    
    BEGIN

        UPDATE DIGWEB.IMX01
         SET EDOIMX = PAEDOIMX
        WHERE APPIMX = PAFCAPPIMX
          AND IMX01 = PAIMX01;
          
    EXCEPTION
        WHEN OTHERS THEN 
            VFCMSG := SQLERRM;
            VFIERROR := 1;
    
    END;
        
    IF VFIERROR = 1 THEN
      ROLLBACK;
       OPEN VCursorsalida FOR
         SELECT 'ERROR' MSG, VFCMSG FCCAUSA
          FROM DUAL;
       RETURN VCursorsalida;
    ELSE
     COMMIT;
       OPEN VCursorsalida FOR
        SELECT 'CORRECTO' MSG,'OK' FCCAUSA
         FROM DUAL;
         RETURN VCursorsalida;
    END IF;
    
    EXCEPTION
    WHEN OTHERS THEN 
        OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCMSG) MSG FROM DUAL;
        RETURN VCursorsalida;

    END;            


/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDGTGRABADOCTOWS
DESCRIPCION: FUNCION QUE CREAD DOCUMENTO, AGREGA PAGINAS A DOCUMENTO PARA EL WEBSERVICE PARA SUBIR
             EXPEDIENTES 
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 12/03/2011
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDGTGRABADOCTOWS             (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                ,
                                        PAIDDOCIMX                      IN    DIGWEB.IMX02.IDDOCIMX%TYPE                              ,                                                                                 
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                               ,
                                        PAUSUARIO                       IN    DIGWEB.IMX03.USUARIOIMX%TYPE                            ,
                                        PAWS                            IN    DIGWEB.IMX03.WSIMX%TYPE                                 ,
                                        PAIMX01                         IN    DIGWEB.IMX01.IMX01%TYPE                                 ,  
                                        PAFCCARPETABASE                 IN    VARCHAR2                                                ,
                                        PAEXTENSIONARCH                 IN    VARCHAR2)
 
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 


VFCRUTABASE                     VARCHAR2(300);
VFCRUTA1                        VARCHAR2(512);
VFCRUTA2                        VARCHAR2(512);
VFCRUTA3                        VARCHAR2(512);
VFCRUTA4                        VARCHAR2(512);
VFCMSG                          VARCHAR2(300);
VFCDESCDOCTO                    VARCHAR(64);
VFCNOMARCH                      VARCHAR(64);

VFIERROR                        NUMBER;
VFIIDDOCIMX                     NUMBER;
VFIPAGINASIG                    NUMBER;
VFINOMPAG                       NUMBER;
VFIOPEDOCTO                     NUMBER;



BEGIN  

    BEGIN  
    
        
        
        SELECT FCDESCDOCUMENTO
        INTO VFCDESCDOCTO
        FROM DIGWEB.CATDOCUMENTOS
        WHERE FIOPEDOCUMENTO = 
                                (
                                  SELECT FIOPEDOCUMENTO 
                                  FROM DIGWEB.CATOPERADOCTOS
                                  WHERE FCDESCOPERADOCTO = PAFCAPPIMX                                                             
                                ) 
          AND FIIDDOCUMENTO = PAIDDOCIMX
          AND FISUBPRODUCTO = PASUBPRODUCTO
          AND FIETAPA = PAETAPA;

        IF SQL%ROWCOUNT > 0 THEN
        
           BEGIN
           
                SELECT DOCIMX
                INTO VFIIDDOCIMX
                FROM DIGWEB.IMX02
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX
                  AND IDDOCIMX = PAIDDOCIMX
                  AND FISUBPRODUCTO = PASUBPRODUCTO
                  AND FIETAPA = PAETAPA;
                  
                  UPDATE DIGWEB.IMX02
                  SET STATUSIMX = 1
                  WHERE APPIMX = PAFCAPPIMX 
                   AND EXPIMX = PAEXPIMX
                   AND DOCIMX = VFIIDDOCIMX
                   AND FISUBPRODUCTO = PASUBPRODUCTO
                   AND FIETAPA = PAETAPA;
                  
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    BEGIN
                        SELECT NVL(MAX(DOCIMX),0)+1
                        INTO VFIIDDOCIMX
                        FROM DIGWEB.IMX02
                        WHERE APPIMX = PAFCAPPIMX 
                          AND EXPIMX = PAEXPIMX;
                      
                        INSERT INTO DIGWEB.IMX02 
                              (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA)
                        VALUES(PAFCAPPIMX,PAEXPIMX,VFIIDDOCIMX,PAIDDOCIMX,VFCDESCDOCTO,1,PASUBPRODUCTO,PAETAPA);
                    END;  
           END; 
           
           BEGIN 
             
                SELECT NVL(MAX(PAGIMX),0)+1
                INTO VFIPAGINASIG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX
                  AND DOCIMX = VFIIDDOCIMX
                  AND FISUBPRODUCTO = PASUBPRODUCTO
                  AND FIETAPA = PAETAPA;
                  
                SELECT NVL(MAX(ROWNUM),0)+1
                INTO VFINOMPAG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX
                  AND DOCIMX = VFIIDDOCIMX
                  AND FISUBPRODUCTO = PASUBPRODUCTO
                  AND FIETAPA = PAETAPA
                  AND STATUSIMX = 1;
                  
                  
                VFCRUTABASE := DIGWEB.PKDIGITALIZADOCTOS.FNDIGRUTABASE(PAFCAPPIMX,PAEXPIMX,PAFCCARPETABASE);
                
                VFCNOMARCH := TO_CHAR(PAEXPIMX) || LPAD(TO_CHAR(VFINOMPAG),4,0) || '.' ||PAEXTENSIONARCH;
                
                VFCRUTA1 :=   VFCRUTABASE || PAIMX01 || '/'|| PAIMX01 || '-' || PASUBPRODUCTO || '-' || PAETAPA || '/' || PAIDDOCIMX || '/';
                 
                VFCRUTA2 :=   VFCRUTA1 || VFCNOMARCH;
                
                VFCRUTA3 :=   VFCRUTABASE || PAIMX01 || '/';
                 
                VFCRUTA4 :=   VFCRUTABASE || PAIMX01 || '/'|| PAIMX01 || '-' || PASUBPRODUCTO || '-' || PAETAPA || '/';
                
                INSERT INTO DIGWEB.IMX03
                (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX)
                VALUES(PAFCAPPIMX,PAEXPIMX,VFIIDDOCIMX,VFIPAGINASIG,VFCNOMARCH,VFCRUTA2,1,PASUBPRODUCTO,PAETAPA,PAUSUARIO,PAWS,SYSDATE);

           END;           
           
        END IF;
   
        EXCEPTION
        WHEN NO_DATA_FOUND THEN 
        BEGIN 
            VFCMSG := 'No existe el documento';
            VFIERROR := 1;   
        END;
            
        WHEN OTHERS THEN
        BEGIN    
            VFCMSG := SQLERRM;
            VFIERROR := 1;
        END;
    
    END;
    
    IF VFIERROR = 1 THEN
      ROLLBACK;
       OPEN VCursorsalida FOR
         SELECT '' R1, '' R2,'' R3, '' R4, '' DOCIMX, '' PAGIMX, VFCMSG MSG
          FROM DUAL;
       RETURN VCursorsalida;
    ELSE
     COMMIT;
       OPEN VCursorsalida FOR
        SELECT VFCRUTA1 R1, VFCRUTA2 R2,VFCRUTA3 R3, VFCRUTA4 R4,VFIIDDOCIMX DOCIMX, VFIPAGINASIG PAGIMX, 'OK' MSG
         FROM DUAL;
         RETURN VCursorsalida;
    END IF;
    
    EXCEPTION 
        WHEN OTHERS THEN 
        VFCMSG := SQLERRM;
        OPEN VCursorsalida FOR
            SELECT '' R1, '' R2, '' R3, '' R4, '' DOCIMX, '' PAGIMX, VFCMSG MSG
            FROM DUAL;
        RETURN VCursorsalida;            
            
END;





/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDGTBORRAPAGINAWS
DESCRIPCION: FUNCION QUE REALIZAE EL BORRADO DE PAGINAS DE UN EXPEDIENTE SUBIDO POR WEBSERVICE
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 12/03/2011 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDGTBORRAPAGINAWS            (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                ,  
                                        PADOCIMX                        IN    DIGWEB.IMX02.DOCIMX%TYPE                                ,                                                                                 
                                        PAPAGIMX                        IN    DIGWEB.IMX03.PAGIMX%TYPE                                ,  
                                        PASUBPRODUCTO                   IN    DIGWEB.IMX02.FISUBPRODUCTO%TYPE                         , 
                                        PAETAPA                         IN    DIGWEB.IMX02.FIETAPA%TYPE                               ,
                                        PAUSUARIO                       IN    DIGWEB.IMX03.USUARIOIMX%TYPE                            ,
                                        PAWS                            IN    DIGWEB.IMX03.WSIMX%TYPE)
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

 
VFICONTADORPAG                  NUMBER;
VFICONTADOR                     NUMBER;
VFCMSG                          VARCHAR2(300);
VFIERROR                        NUMBER;
VFCBORRADO                      VARCHAR2(128);


BEGIN

   BEGIN 
        
        VFCBORRADO := 'NINGUNO';
             
        DELETE DIGWEB.IMX03
        WHERE APPIMX = PAFCAPPIMX
          AND EXPIMX = PAEXPIMX
          AND DOCIMX = PADOCIMX
          AND PAGIMX = PAPAGIMX
          AND FISUBPRODUCTO = PASUBPRODUCTO
          AND FIETAPA = PAETAPA;

        SELECT COUNT(APPIMX)
        INTO VFICONTADORPAG
        FROM DIGWEB.IMX03
        WHERE APPIMX = PAFCAPPIMX 
          AND EXPIMX = PAEXPIMX
          AND DOCIMX = PADOCIMX
          AND FISUBPRODUCTO = PASUBPRODUCTO
          AND FIETAPA = PAETAPA;
              
              
         IF VFICONTADORPAG = 0 THEN             
             
            DELETE DIGWEB.IMX02            
            WHERE APPIMX = PAFCAPPIMX 
              AND EXPIMX = PAEXPIMX
              AND DOCIMX = PADOCIMX
              AND FISUBPRODUCTO = PASUBPRODUCTO
              AND FIETAPA = PAETAPA;
                 
             VFCBORRADO := 'TODO DOCUMENTO';
             
             SELECT COUNT(APPIMX)
             INTO VFICONTADOR
             FROM DIGWEB.IMX02
             WHERE APPIMX = PAFCAPPIMX 
               AND EXPIMX = PAEXPIMX
               AND FISUBPRODUCTO = PASUBPRODUCTO
               AND FIETAPA = PAETAPA;
             
             IF VFICONTADOR = 0 THEN
                
                VFCBORRADO := 'TODO DOCUMENTO SUBPRODUCTO';
                
             END IF;  
             
             SELECT COUNT(APPIMX)
             INTO VFICONTADOR
             FROM DIGWEB.IMX02
             WHERE APPIMX = PAFCAPPIMX 
               AND EXPIMX = PAEXPIMX;
             
             IF VFICONTADOR = 0 THEN
                 
              DELETE DIGWEB.IMX01                
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX;   
 
                VFCBORRADO := 'TODO EXPEDIENTE';
                
             END IF;             
         
         ELSE
         
            SELECT COUNT(APPIMX)
            INTO VFICONTADORPAG
            FROM DIGWEB.IMX03
            WHERE APPIMX = PAFCAPPIMX 
              AND EXPIMX = PAEXPIMX
              AND DOCIMX = PADOCIMX
              AND FISUBPRODUCTO = PASUBPRODUCTO
              AND FIETAPA = PAETAPA
              AND STATUSIMX = 1;
                  
                  
             IF VFICONTADORPAG = 0 THEN             
                 
                UPDATE DIGWEB.IMX02
                SET STATUSIMX = 0
                WHERE APPIMX = PAFCAPPIMX 
                  AND EXPIMX = PAEXPIMX
                  AND DOCIMX = PADOCIMX
                  AND FISUBPRODUCTO = PASUBPRODUCTO
                  AND FIETAPA = PAETAPA;                 

                     
                 SELECT COUNT(APPIMX)
                 INTO VFICONTADOR
                 FROM DIGWEB.IMX02
                 WHERE APPIMX = PAFCAPPIMX 
                   AND EXPIMX = PAEXPIMX
                   AND STATUSIMX = 1;
                      
                 IF VFICONTADOR = 0 THEN
                     
                  UPDATE DIGWEB.IMX01
                    SET EDOIMX = 'N'
                    WHERE APPIMX = PAFCAPPIMX 
                      AND EXPIMX = PAEXPIMX;   
     
                 END IF;             
                 
             END IF;
             
         END IF;
   
   
   EXCEPTION
    WHEN OTHERS THEN 
        VFCMSG := SQLERRM;
        VFIERROR := 1;                  
   END;  
    
    IF VFIERROR = 1 THEN
      ROLLBACK;
       OPEN VCursorsalida FOR
         SELECT VFCMSG MSG, '' FCNIVELBORRADO
          FROM DUAL;
       RETURN VCursorsalida;
    ELSE
     COMMIT;
       OPEN VCursorsalida FOR
        SELECT 'OK' MSG, VFCBORRADO FCNIVELBORRADO
         FROM DUAL;
         RETURN VCursorsalida;
    END IF;
    
    EXCEPTION
    WHEN OTHERS THEN 
        OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCMSG) MSG, '' FCNIVELBORRADO FROM DUAL;
        RETURN VCursorsalida;

END;


/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGITALIZADOCTOS.FNDIGCAMBIASTEXP
DESCRIPCION: FUNCION QUE REALIZA LA ACTUALIZACION DEL EXPEDIENTE 
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 16/08/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
FUNCTION FNDGUCAMBIASTEXPWS            (PAFCAPPIMX                      IN    DIGWEB.IMX01.APPIMX%TYPE                                ,
                                        PAEXPIMX                        IN    DIGWEB.IMX01.EXPIMX%TYPE                                , 
                                        PAEDOIMX                        IN    DIGWEB.IMX01.EDOIMX%TYPE )
                                        
RETURN DIGCURSOR

IS

VCursorsalida DIGCURSOR; 

VFCAPPIMX                       VARCHAR2(50);
VFCMSG                          VARCHAR2(300);
VFIERROR                        NUMBER;


BEGIN     
    
    BEGIN

        UPDATE DIGWEB.IMX01
         SET EDOIMX = PAEDOIMX,
             USOIMX = 0
        WHERE APPIMX = PAFCAPPIMX
          AND EXPIMX = PAEXPIMX;
          
    EXCEPTION
        WHEN OTHERS THEN 
            VFCMSG := SQLERRM;
            VFIERROR := 1;
    
    END;
        
    IF VFIERROR = 1 THEN
      ROLLBACK;
       OPEN VCursorsalida FOR
         SELECT 'ERROR' MSG, VFCMSG FCCAUSA
          FROM DUAL;
       RETURN VCursorsalida;
    ELSE
     COMMIT;
       OPEN VCursorsalida FOR
        SELECT 'CORRECTO' MSG,'OK' FCCAUSA
         FROM DUAL;
         RETURN VCursorsalida;
    END IF;
    
    EXCEPTION
    WHEN OTHERS THEN 
        OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCMSG) MSG,' ' FCCAUSA FROM DUAL;
        RETURN VCursorsalida;

    END;            
                                                                                                                                 
END PKDIGITALIZADOCTOS;
/


--
-- PKDIGORDERDOCS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGORDERDOCS AS

PROCEDURE SPDIGADMONORDERDOCS(paOperacion IN NUMBER,paORDERDOC IN NUMBER, paFIOPEDOCUMENTO IN NUMBER, paFIETAPA IN NUMBER, paFISUBPRODUCTO IN NUMBER, paFIDDOCUMENTO IN NUMBER, paIDTABLA IN NUMBER)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN

        SELECT nvl(max(ORDERDOC),0)+1 max into maxId  FROM DIGWEB.ORDERDOCS WHERE FIOPEDOCUMENTO=paFIOPEDOCUMENTO AND FISUBPRODUCTO = paFISUBPRODUCTO AND FIETAPA=paFIETAPA;
        INSERT INTO DIGWEB.ORDERDOCS (ORDERDOC, FIOPEDOCUMENTO, FIETAPA, FISUBPRODUCTO, FIDDOCUMENTO, IDTABLA)
               values(maxId, paFIOPEDOCUMENTO, paFIETAPA, paFISUBPRODUCTO, paFIDDOCUMENTO, paIDTABLA);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.ORDERDOCS WHERE ORDERDOC=paORDERDOC AND FIOPEDOCUMENTO=paFIOPEDOCUMENTO AND FIETAPA=paFIETAPA
        AND FISUBPRODUCTO=paFISUBPRODUCTO AND FIDDOCUMENTO=paFIDDOCUMENTO AND IDTABLA=paIDTABLA;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


PROCEDURE SPDIGADMONCATOPERADOCTOS(paOperacion IN NUMBER,paFIOPEDOCUMENTO IN NUMBER,paFCDESCOPERADOCTO IN CHAR,paFCDESCCORTA IN CHAR,paFCEMPACTUALIZA IN CHAR)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN
         select nvl(max(FIOPEDOCUMENTO),0)+1 max into maxId from DIGWEB.CATOPERADOCTOS;
        INSERT INTO DIGWEB.CATOPERADOCTOS (FIOPEDOCUMENTO,FCDESCOPERADOCTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA)
               values(maxId,paFCDESCOPERADOCTO,paFCDESCCORTA,to_date(sysdate,'dd/mm/yyyy'),paFCEMPACTUALIZA);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.CATOPERADOCTOS WHERE FIOPEDOCUMENTO=paFIOPEDOCUMENTO;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.CATOPERADOCTOS SET FCDESCOPERADOCTO=paFCDESCOPERADOCTO, FCDESCCORTA=paFCDESCCORTA,
        FDFECULTACTUALIZACION=to_date(sysdate,'dd/mm/yyyy'),FCEMPACTUALIZA = paFCEMPACTUALIZA
        WHERE FIOPEDOCUMENTO=paFIOPEDOCUMENTO;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


PROCEDURE SPDIGADMONCATDESCDOCUMENTOS(paOperacion IN NUMBER,paFIIDDOCUMENTO IN NUMBER,paFCDESCDOCUMENTO IN CHAR,paFCDESCCORTA IN CHAR,paFCPROPIETARIO IN VARCHAR2,paFCORIGENDOCTO IN VARCHAR2,paFCEMPACTUALIZA IN CHAR,paFIDOCSUCID IN NUMBER)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN
           select nvl(max(FIIDDOCUMENTO),0)+1 max into maxId from DIGWEB.CATDESCDOCUMENTOS;
        INSERT INTO DIGWEB.CATDESCDOCUMENTOS (FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FCPROPIETARIO,FCORIGENDOCTO,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FIDOCSUCID)
               values(maxId,paFCDESCDOCUMENTO,paFCDESCCORTA,paFCPROPIETARIO,paFCORIGENDOCTO,to_date(sysdate,'dd/mm/yyyy'),paFCEMPACTUALIZA,paFIDOCSUCID);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.CATDESCDOCUMENTOS WHERE FIIDDOCUMENTO=paFIIDDOCUMENTO;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.CATDESCDOCUMENTOS SET FCDESCDOCUMENTO=paFCDESCDOCUMENTO,FCDESCCORTA=paFCDESCCORTA,FCPROPIETARIO=paFCPROPIETARIO,FCORIGENDOCTO=paFCORIGENDOCTO,
        FDFECULTACTUALIZACION=to_date(sysdate,'dd/mm/yyyy'),FCEMPACTUALIZA=paFCEMPACTUALIZA,FIDOCSUCID=paFIDOCSUCID
        WHERE FIIDDOCUMENTO=paFIIDDOCUMENTO;
        COMMIT;
    ELSIF paOperacion=4 THEN
        UPDATE DIGWEB.CATDESCDOCUMENTOS SET FDFECULTACTUALIZACION=to_date(sysdate,'dd/mm/yyyy'),FCEMPACTUALIZA=paFCEMPACTUALIZA,FIDOCSUCID=paFIDOCSUCID
        WHERE FIIDDOCUMENTO=paFIIDDOCUMENTO;
        COMMIT;    
    ELSIF paOperacion=5 THEN
        INSERT INTO DIGWEB.CATDESCDOCUMENTOS (FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FCPROPIETARIO,FCORIGENDOCTO,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FIDOCSUCID)
        VALUES(paFIIDDOCUMENTO,paFCDESCDOCUMENTO,paFCDESCCORTA,paFCPROPIETARIO,paFCORIGENDOCTO,to_date(sysdate,'dd/mm/yyyy'),paFCEMPACTUALIZA,paFIDOCSUCID);
            COMMIT;
    
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

PROCEDURE SPDIGADMONCATDOCUMENTOS(paOperacion IN NUMBER,paFIOPEDOCUMENTO IN NUMBER,paFIIDDOCUMENTO  IN NUMBER,paFCDESCDOCUMENTO IN CHAR,paFCDESCCORTA IN CHAR,paFCEMPACTUALIZA IN CHAR,paFISTATUS  IN NUMBER,paFIAGREGAPAG  IN NUMBER,paFIETAPA  IN NUMBER,paFISUBPRODUCTO  IN NUMBER)
IS
BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.CATDOCUMENTOS (FIOPEDOCUMENTO,FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FISTATUS,FIAGREGAPAG,FIETAPA,FISUBPRODUCTO)
               values(paFIOPEDOCUMENTO,paFIIDDOCUMENTO,paFCDESCDOCUMENTO,paFCDESCCORTA,to_date(sysdate,'dd/mm/yyyy'),paFCEMPACTUALIZA,paFISTATUS,paFIAGREGAPAG,paFIETAPA,paFISUBPRODUCTO);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.CATDOCUMENTOS WHERE FIOPEDOCUMENTO=paFIOPEDOCUMENTO AND FIIDDOCUMENTO=paFIIDDOCUMENTO AND FIETAPA=paFIETAPA AND FISUBPRODUCTO=paFISUBPRODUCTO ;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


FUNCTION FNDIGCONORDERDOCS (paFIOPEDOCUMENTO IN NUMBER) RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;
BEGIN
     OPEN DIGCURSALIDA FOR
          SELECT ORDERDOC,FIOPEDOCUMENTO,FIETAPA,FISUBPRODUCTO,FIDDOCUMENTO,IDTABLA
          FROM DIGWEB.ORDERDOCS 
          WHERE FIOPEDOCUMENTO = paFIOPEDOCUMENTO ORDER BY FIOPEDOCUMENTO, FIETAPA, FISUBPRODUCTO, FIDDOCUMENTO,ORDERDOC, IDTABLA;
     RETURN DIGCURSALIDA;     
EXCEPTION
        WHEN OTHERS THEN
            OPEN DIGCURSALIDA FOR
                SELECT 'No existe informacion' MSG FROM DUAL;
            RETURN DIGCURSALIDA;  
END;


PROCEDURE SPDIGADMONENCABIMX(paOperacion IN NUMBER,paID IN NUMBER,paAPPIMX IN VARCHAR2,paIMX IN VARCHAR2,paDESCIMX IN VARCHAR2)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN
        SELECT nvl(max(ID),0)+1 max into maxId FROM DIGWEB.ENCABIMX WHERE APPIMX=paAPPIMX;
        INSERT INTO DIGWEB.ENCABIMX (ID,APPIMX,IMX,DESCIMX) VALUES (maxId,paAPPIMX,paIMX,paDESCIMX);
        COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.ENCABIMX WHERE ID=paID AND APPIMX=paAPPIMX;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.ENCABIMX SET IMX=paIMX,DESCIMX=paDESCIMX
        WHERE ID=paID AND APPIMX=paAPPIMX;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


PROCEDURE SPDIGADMONENCABEZADO(paOperacion IN NUMBER,paAPPIMX IN VARCHAR2,paRUTA IN VARCHAR2)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.ENCABEZADO (APPIMX,RUTA) VALUES (paAPPIMX,paRUTA);
        COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.ENCABEZADO WHERE APPIMX=paAPPIMX;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.ENCABEZADO SET RUTA=paRUTA
        WHERE APPIMX=paAPPIMX;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


PROCEDURE SPDIGADMONTASERVCOLUMN(paOperacion IN NUMBER,paFCDESCSERV IN VARCHAR2,paFCCLUMNA IN VARCHAR2,paFCTIPOCOLUMNA IN VARCHAR2,paFCCORRESP_IMAX IN VARCHAR2)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.TASERVCOLUMN (FCDESCSERV,FCCLUMNA,FCTIPOCOLUMNA,FCCORRESP_IMAX) VALUES (paFCDESCSERV,paFCCLUMNA,paFCTIPOCOLUMNA,paFCCORRESP_IMAX);
        COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.TASERVCOLUMN WHERE FCDESCSERV=paFCDESCSERV and FCCLUMNA=paFCCLUMNA;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.TASERVCOLUMN SET FCTIPOCOLUMNA=paFCTIPOCOLUMNA,FCCORRESP_IMAX=paFCCORRESP_IMAX
        WHERE FCDESCSERV=paFCDESCSERV and FCCLUMNA=paFCCLUMNA;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


PROCEDURE SPDIGADMONTASERVICIOSDG(paOperacion IN NUMBER,paFCDESCSERV IN VARCHAR2)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.TASERVICIOSDG (FCDESCSERV) VALUES (paFCDESCSERV);
        COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.TASERVICIOSDG WHERE FCDESCSERV=paFCDESCSERV;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


PROCEDURE SPDIGADMONDOCTOSBASE(paOperacion IN NUMBER,paFIOPEDOCUMENTO IN NUMBER,paFIDDOCUMENTO IN NUMBER)
IS
BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.DOCTOSBASE (FIOPEDOCUMENTO,FIDDOCUMENTO) VALUES (paFIOPEDOCUMENTO,    paFIDDOCUMENTO);
        COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.DOCTOSBASE WHERE FIOPEDOCUMENTO=paFIOPEDOCUMENTO AND FIDDOCUMENTO=paFIDDOCUMENTO;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;


END PKDIGORDERDOCS;
/


--
-- PKDIGVISOR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGVISOR AS

/***********************************************************************************************

NAME: DIGWEB.PKDIGVISOR
DESCRIPCION: PACKAGE DE FUNCIONES QUE SE UTILIZAN PARA EL VISOR GENERAL DE DIGITALIZACION
AUTOR: ARMANDO OSORIO HERNANDEZ
FECHA CREACION: 28/07/2009
VERSION: 1.0
FECHA MODIFICACION:05/10/2010
NOTAS:

************************************************************************************************/

/***********************************************************************************************

NAME: DIGWEB.PKDIGVISOR.FNDIGGETDOCTOS
DESCRIPCION: FUNCIONES PARA OBTENER TODOS LOS DOCUMENTOS DE UN EXPEDIENTE DIGITALIZADO
AUTOR: ARMANDO OSORIO HERNANDEZ
FECHA CREACION: 25/05/2009
VERSION: 1.0
FECHA MODIFICACION:
NOTAS:

************************************************************************************************/

FUNCTION FNDIGGETDOCTOS       (PAFCAPPIMX           IN  DIGWEB.IMX01.APPIMX%TYPE,             
                               PAFCKEY              IN  DIGWEB.IMX01.IMX01%TYPE,                               
                               PAFISTATUS           IN      NUMBER)
RETURN DIGCURSOR

IS
cCursorsalida DIGCURSOR;
FIID          NUMBER:=0;

BEGIN

    SELECT EXPIMX
    INTO FIID
    FROM DIGWEB.IMX01
    WHERE APPIMX = PAFCAPPIMX AND IMX01 = PAFCKEY;
                    
    IF PAFISTATUS = 1 OR PAFISTATUS = 0 THEN
                    
        OPEN cCursorsalida FOR
            SELECT DOCIMX,NOMDOCIMX,IDDOCIMX
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX AND EXPIMX = FIID AND STATUSIMX = PAFISTATUS;                                   
        RETURN cCursorsalida;
                    
    ELSE
                                        
        OPEN cCursorsalida FOR
            SELECT DOCIMX,NOMDOCIMX,IDDOCIMX
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX AND EXPIMX = FIID;                                 
        RETURN cCursorsalida;
                    
    END IF;
                                        
                                
    EXCEPTION
        WHEN NO_DATA_FOUND THEN     
            OPEN cCursorsalida FOR
                SELECT 'No existe informacion' MSG FROM DUAL;
            RETURN cCursorsalida;  

        WHEN OTHERS THEN
            NULL;
END;

                                                          

/***********************************************************************************************

NAME: DIGWEB.PKDIGVISOR.FNGETDOCDIGWEB
DESCRIPCION: FUNCIONES PARA OBTENER EL DOCUMENTO O TODOS LOS DOCUMENTOS DE UN EXPEDIENTE DIGITALIZADO
             DE LA GAVETA CREDITO
AUTOR: ARMANDO OSORIO HERNANDEZ
FECHA CREACION: 28/07/2009
VERSION: 1.0
FECHA MODIFICACION:
NOTAS:

************************************************************************************************/

FUNCTION FNGETDOCDIGWEB       (PAFCAPPIMX           IN  DIGWEB.IMX01.APPIMX%TYPE,             
                               PAFCKEY              IN  DIGWEB.IMX01.IMX01%TYPE,
                               PAFITIPODOCTO        IN  NUMBER,
                               PAFISTATUSIMX        IN  NUMBER,
                               PAFCTIPOOS           IN  VARCHAR2,
                               PAFINUMPAG           IN  NUMBER)  


RETURN DIGCURSOR      

IS

cCursorsalida DIGCURSOR;
FIID             NUMBER:=0;
FIPOS            NUMBER:=0;
FIPOS2           NUMBER:=0;
FIPOS3           NUMBER:=0;
VRUTA            varchar2(2000);
VRUTA2           varchar2(2000);


BEGIN

    SELECT EXPIMX
    INTO FIID
    FROM DIGWEB.IMX01
    WHERE APPIMX = PAFCAPPIMX AND IMX01 = PAFCKEY;        
          
    IF FIID > 0 THEN
             
        IF PAFISTATUSIMX = 1 OR PAFISTATUSIMX = 0 THEN
                    
            IF PAFCTIPOOS = 'P' THEN
                  
                OPEN cCursorsalida FOR                                            
                    SELECT COUNT(X2.NOMDOCIMX) TOTALPAG ,X2.NOMDOCIMX DOCUMENTO
                    FROM DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                    WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX 
                      AND X2.DOCIMX = X3.DOCIMX  
                      AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                      AND X3.STATUSIMX = PAFISTATUSIMX AND X2.IDDOCIMX = PAFITIPODOCTO 
                    GROUP BY NOMDOCIMX;                    
                RETURN cCursorsalida;                

                       
            ELSIF PAFCTIPOOS = 'IU' THEN


                SELECT R.RUTA INTO VRUTA FROM
                    (SELECT ROWNUM PAG ,X3.PAGIMX,TRIM(X3.RUTIMX) AS RUTA,X1.IMX01 LLAVE,X2.NOMDOCIMX,X2.IDDOCIMX
                     FROM DIGWEB.IMX01 X1, DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                     WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX
                       AND X2.APPIMX = X1.APPIMX AND X2.EXPIMX = X1.EXPIMX  
                       AND X2.DOCIMX = X3.DOCIMX 
                       AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                       AND X3.STATUSIMX = PAFISTATUSIMX AND X2.IDDOCIMX = PAFITIPODOCTO 
                     ORDER BY X3.PAGIMX) R
                WHERE R.PAG = PAFINUMPAG;

                SELECT INSTR(VRUTA,'digitalizacion_web') INTO FIPOS FROM DUAL;
                IF FIPOS > 13 THEN
                    FIPOS2:=FIPOS-4;
            
                ELSE
                    FIPOS2:=FIPOS;
                    FIPOS:=FIPOS+19;
            
                END IF;
               
            
                SELECT '/' ||FCALIAS || '/' || SUBSTR(VRUTA,FIPOS) INTO VRUTA2 FROM DIGWEB.DIG_UNIDAD_VOLUMEN WHERE FCRUTASOL=SUBSTR(VRUTA,1,FIPOS2-2); 
                           
            
                OPEN cCursorsalida FOR
                    SELECT R.PAGIMX,VRUTA2 RUTA,R.LLAVE,R.NOMDOCIMX,R.IDDOCIMX FROM
                        (SELECT ROWNUM PAG ,X3.PAGIMX,X1.IMX01 LLAVE,X2.NOMDOCIMX,X2.IDDOCIMX
                         FROM DIGWEB.IMX01 X1, DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                         WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX
                           AND X2.APPIMX = X1.APPIMX AND X2.EXPIMX = X1.EXPIMX  
                           AND X2.DOCIMX = X3.DOCIMX 
                           AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                           AND X3.STATUSIMX = PAFISTATUSIMX AND X2.IDDOCIMX = PAFITIPODOCTO 
                         ORDER BY X3.PAGIMX) R
                    WHERE R.PAG = PAFINUMPAG;
                RETURN cCursorsalida;
                

                            
            ELSIF PAFCTIPOOS = 'TU' THEN
                  

                SELECT DISTINCT SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,'digitalizacion_web')-2) INTO VRUTA
                FROM DIGWEB.IMX01 X1, DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX
                  AND X2.APPIMX = X1.APPIMX AND X2.EXPIMX = X1.EXPIMX  
                      AND X2.DOCIMX = X3.DOCIMX 
                      AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                      AND X3.STATUSIMX = PAFISTATUSIMX AND X2.IDDOCIMX = PAFITIPODOCTO; 

                                    
                SELECT LENGTH(VRUTA) INTO FIPOS FROM DUAL;
            
                    IF FIPOS > 13 THEN
                        FIPOS2:=FIPOS-4;
                        FIPOS3:=FIPOS+2;
                    ELSE
                        FIPOS2:=FIPOS;
                        FIPOS3:=FIPOS+21;
                    END IF;
                   

                SELECT '/' ||FCALIAS || '/'  INTO VRUTA2 FROM DIGWEB.DIG_UNIDAD_VOLUMEN WHERE FCRUTASOL=SUBSTR(VRUTA,1,FIPOS2);
            
                OPEN cCursorsalida FOR
                    SELECT X3.PAGIMX,VRUTA2 || SUBSTR(X3.RUTIMX,FIPOS3) AS RUTA,X1.IMX01 LLAVE,X2.NOMDOCIMX,X2.IDDOCIMX
                    FROM DIGWEB.IMX01 X1, DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                    WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX
                      AND X2.APPIMX = X1.APPIMX AND X2.EXPIMX = X1.EXPIMX  
                      AND X2.DOCIMX = X3.DOCIMX 
                      AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                      AND X3.STATUSIMX = PAFISTATUSIMX AND X2.IDDOCIMX = PAFITIPODOCTO 
                    ORDER BY X3.PAGIMX;                         
                RETURN cCursorsalida;   
            END IF;    
                    
        ELSE
        
            IF PAFCTIPOOS = 'P' THEN
                  
                OPEN cCursorsalida FOR                                            
                    SELECT COUNT(X2.NOMDOCIMX) TOTALPAG,X2.NOMDOCIMX DOCUMENTO
                    FROM DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                    WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX 
                      AND X2.DOCIMX = X3.DOCIMX  
                      AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                      AND X2.IDDOCIMX = PAFITIPODOCTO 
                    GROUP BY NOMDOCIMX;                    
                RETURN cCursorsalida;                

                       
            ELSIF PAFCTIPOOS = 'IU' THEN
            
            SELECT R.RUTA INTO VRUTA FROM
                    (SELECT ROWNUM PAG ,X3.PAGIMX,TRIM(X3.RUTIMX) AS RUTA,X1.IMX01 LLAVE,X2.NOMDOCIMX,X2.IDDOCIMX
                     FROM DIGWEB.IMX01 X1, DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                     WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX
                       AND X2.APPIMX = X1.APPIMX AND X2.EXPIMX = X1.EXPIMX  
                       AND X2.DOCIMX = X3.DOCIMX 
                       AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                       AND X2.IDDOCIMX = PAFITIPODOCTO 
                     ORDER BY X3.PAGIMX) R
                WHERE R.PAG = PAFINUMPAG;

                SELECT INSTR(VRUTA,'digitalizacion_web') INTO FIPOS FROM DUAL;
                IF FIPOS > 13 THEN
                    FIPOS2:=FIPOS-4;
            
                ELSE
                    FIPOS2:=FIPOS;
                    FIPOS:=FIPOS+19;
            
                END IF;
               
            
                SELECT '/' ||FCALIAS || '/' || SUBSTR(VRUTA,FIPOS) INTO VRUTA2 FROM DIGWEB.DIG_UNIDAD_VOLUMEN WHERE FCRUTASOL=SUBSTR(VRUTA,1,FIPOS2-2); 
                           

                  
                OPEN cCursorsalida FOR
                    SELECT R.PAGIMX,VRUTA2 RUTA,R.LLAVE,R.NOMDOCIMX,R.IDDOCIMX FROM
                        (SELECT ROWNUM PAG ,X3.PAGIMX,X1.IMX01 LLAVE,X2.NOMDOCIMX,X2.IDDOCIMX
                         FROM DIGWEB.IMX01 X1, DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                         WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX
                           AND X2.APPIMX = X1.APPIMX AND X2.EXPIMX = X1.EXPIMX  
                           AND X2.DOCIMX = X3.DOCIMX 
                           AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                           AND X2.IDDOCIMX = PAFITIPODOCTO 
                         ORDER BY X3.PAGIMX) R
                    WHERE R.PAG = PAFINUMPAG;
                RETURN cCursorsalida;
                

                            
            ELSIF PAFCTIPOOS = 'TU' THEN
                  
            
                SELECT DISTINCT SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,'digitalizacion_web')-2) INTO VRUTA
                FROM DIGWEB.IMX01 X1, DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX
                  AND X2.APPIMX = X1.APPIMX AND X2.EXPIMX = X1.EXPIMX  
                      AND X2.DOCIMX = X3.DOCIMX 
                      AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                      AND X2.IDDOCIMX = PAFITIPODOCTO; 

                                    
                SELECT LENGTH(VRUTA) INTO FIPOS FROM DUAL;
            
                    IF FIPOS > 13 THEN
                        FIPOS2:=FIPOS-4;
                        FIPOS3:=FIPOS+2;
                    ELSE
                        FIPOS2:=FIPOS;
                        FIPOS3:=FIPOS+21;
                    END IF;
                   

                SELECT '/' ||FCALIAS || '/'  INTO VRUTA2 FROM DIGWEB.DIG_UNIDAD_VOLUMEN WHERE FCRUTASOL=SUBSTR(VRUTA,1,FIPOS2);

            
                OPEN cCursorsalida FOR
                    SELECT X3.PAGIMX,VRUTA2 || SUBSTR(X3.RUTIMX,FIPOS3) AS RUTA,X1.IMX01 LLAVE,X2.NOMDOCIMX,X2.IDDOCIMX
                    FROM DIGWEB.IMX01 X1, DIGWEB.IMX02 X2, DIGWEB.IMX03 X3
                    WHERE X2.APPIMX = X3.APPIMX AND X2.EXPIMX = X3.EXPIMX
                      AND X2.APPIMX = X1.APPIMX AND X2.EXPIMX = X1.EXPIMX  
                      AND X2.DOCIMX = X3.DOCIMX 
                      AND X2.APPIMX = PAFCAPPIMX AND X2.EXPIMX = FIID 
                      AND X2.IDDOCIMX = PAFITIPODOCTO 
                    ORDER BY X3.PAGIMX;                         
                RETURN cCursorsalida;   
            END IF;                        
         
        END IF; 
                                             
    END IF;
              
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN cCursorsalida FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN cCursorsalida;   

    WHEN OTHERS THEN
        NULL;
END;


END PKDIGVISOR;
/


--
-- PKDIGSCANTMPL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGSCANTMPL AS

PROCEDURE SPDIGADMONCATDIGSCANNER(paOperacion IN NUMBER,paFIIDSCANNER IN NUMBER,paFCDESCRIPCION IN varchar2,paFCMODELO IN varchar2,paFCFABRICANTE IN varchar2,paACTIVO IN NUMBER)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN

    SELECT nvl(max(FIIDSCANNER),0)+1 max into maxId  FROM DIGWEB.CATDIGSCANNER;
        INSERT INTO DIGWEB.CATDIGSCANNER (FIIDSCANNER,FCDESCRIPCION,FCMODELO,FCFABRICANTE,ACTIVO)
               values(maxId, paFCDESCRIPCION,paFCMODELO,paFCFABRICANTE,paACTIVO);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.CATDIGSCANNER WHERE FIIDSCANNER=paFIIDSCANNER;
        COMMIT;
       ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.CATDIGSCANNER SET ACTIVO=paACTIVO WHERE FIIDSCANNER=paFIIDSCANNER;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

PROCEDURE SPDIGADMONCATDIGTEMPLATE(paOperacion IN NUMBER,paFIIDTEMPLATE  IN NUMBER,paFIIDSCANNER  IN NUMBER,paFCDESCRIPCION  IN varchar2,paFIVERSION IN NUMBER,paACTIVO IN NUMBER,paFCDFBCATA   IN varchar2)
IS
maxId number;
BEGIN
     IF paOperacion=1 THEN
        INSERT INTO DIGWEB.CATDIGTEMPLATE (FIIDTEMPLATE,FIIDSCANNER,FCDESCRIPCION,FIVERSION,FDCREACION,ACTIVO,FCDFBCATA)
               values(paFIIDTEMPLATE, paFIIDSCANNER,paFCDESCRIPCION,paFIVERSION,SYSDATE,paACTIVO,paFCDFBCATA);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.CATDIGTEMPLATE WHERE FIIDTEMPLATE=paFIIDTEMPLATE AND FIIDSCANNER=paFIIDSCANNER AND FIVERSION=paFIVERSION;
        COMMIT;
    ELSIF paOperacion=3 THEN
        UPDATE DIGWEB.CATDIGTEMPLATE SET ACTIVO=paACTIVO WHERE FIIDTEMPLATE=paFIIDTEMPLATE AND FIIDSCANNER=paFIIDSCANNER;
        COMMIT;
   ELSIF paOperacion=4 THEN
        UPDATE DIGWEB.CATDIGTEMPLATE SET FIVERSION=paFIVERSION WHERE FIIDTEMPLATE=paFIIDTEMPLATE AND FIIDSCANNER=paFIIDSCANNER;
        COMMIT;
  END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;



PROCEDURE SPDIGADMONDIGSCANTMPL(paOperacion IN NUMBER,paFIIDTEMPLATE IN NUMBER,paFIIDSCANNER IN NUMBER,paFIOPEDOCUMENTO IN NUMBER)
IS
BEGIN
     IF paOperacion=1 THEN

        INSERT INTO DIGWEB.DIGSCANTMPL (FIIDTEMPLATE,FIIDSCANNER,FIOPEDOCUMENTO)
               values(paFIIDTEMPLATE,paFIIDSCANNER,paFIOPEDOCUMENTO);
            COMMIT;
    ELSIF paOperacion=2 THEN
        DELETE DIGWEB.DIGSCANTMPL WHERE FIIDTEMPLATE=paFIIDTEMPLATE AND FIIDSCANNER=paFIIDSCANNER AND FIOPEDOCUMENTO=paFIOPEDOCUMENTO;
        COMMIT;
    END IF;
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;



FUNCTION FNDIGCONCATDIGSCANNER(paMODELO IN VARCHAR2)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
        SELECT * from DIGWEB.CATDIGSCANNER
                WHERE FCMODELO =paMODELO ;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;


FUNCTION FNDIGCONCATDIGSCANNERACTIVO(paACTIVO IN VARCHAR2)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
        SELECT * from DIGWEB.CATDIGSCANNER
                WHERE ACTIVO =paACTIVO order by FIIDSCANNER;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;



FUNCTION FNDIGCONCATDIGTEMPLATE(paACTIVO IN NUMBER)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
        SELECT * from DIGWEB.CATDIGTEMPLATE
                WHERE ACTIVO =paACTIVO ;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;


FUNCTION FNDIGCONCATDIGXML(paFIOPEDOCUMENTO IN NUMBER)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
        select b.FCDFBCATA from digweb.DIGSCANTMPL a,digweb.CATDIGTEMPLATE b 
where a.FIIDTEMPLATE =b.FIIDTEMPLATE
and a.FIIDSCANNER =b.FIIDSCANNER
and a.fiopedocumento=paFIOPEDOCUMENTO;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;


FUNCTION FNDIGCONTEMPLATESCAN(paFIOPEDOCUMENTO IN NUMBER,paMODELO IN VARCHAR2)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
select A.FIIDTEMPLATE,A.FIIDSCANNER,A.FCDESCRIPCION,A.FIVERSION,A.FDCREACION,A.ACTIVO,A.FCDFBCATA 
from digweb.CATDIGTEMPLATE a, digweb.DIGSCANTMPL B,digweb.CATDIGSCANNER C 
WHERE B.fiopedocumento=paFIOPEDOCUMENTO AND A.FIIDTEMPLATE=B.FIIDTEMPLATE
AND a.FIVERSION=(select MAX(FIVERSION) from digweb.CATDIGTEMPLATE a, digweb.DIGSCANTMPL B 
WHERE B.fiopedocumento=paFIOPEDOCUMENTO AND A.FIIDTEMPLATE=B.FIIDTEMPLATE)
AND C.FCMODELO=paMODELO
AND A.FIIDSCANNER=C.FIIDSCANNER;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;


FUNCTION FNDIGCONFIOPEDOCUMENTO(paFIOPEDOCUMENTO IN NUMBER)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
select * from digweb.CATOPERADOCTOS WHERE fiopedocumento=paFIOPEDOCUMENTO;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;



FUNCTION FNDIGCONfechaUltProd(paFIOPEDOCUMENTO IN NUMBER)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
select FDCREACION from digweb.CATDIGTEMPLATE a, digweb.DIGSCANTMPL B 
WHERE B.fiopedocumento=paFIOPEDOCUMENTO AND A.FIIDTEMPLATE=B.FIIDTEMPLATE
AND a.FIVERSION=(select MAX(FIVERSION) from digweb.CATDIGTEMPLATE a, digweb.DIGSCANTMPL B 
WHERE B.fiopedocumento=paFIOPEDOCUMENTO AND A.FIIDTEMPLATE=B.FIIDTEMPLATE); 
       RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;



END PKDIGSCANTMPL;
/


--
-- PKDIGABCDOCTOS_BASE  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGABCDOCTOS_BASE AS 
/*********************************************************************************************** 
 
NAME: DIGWEB.PKDIGABCDOCTOS_BASE  
DESCRIPCION: PACKAGE CONTIENE FUNCION QUE SE UTILIZAN PARA EL CATALOGO DE DOCUMENTOS BASE
AUTOR: EDGAR TELLO HERNANDEZ 
FECHA CREACION: 19/10/2010 
FECHA ACTUALIZACION  
VERSION: 1.0 
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/ 
 
 
FUNCTION FNDIGABCDOCTOS_BASE              (PAFIINOPCION                    IN    NUMBER                                                    ,
                                             PAFIOPEDOCUMENTO                IN    DIGWEB.DOCTOSBASE.FIOPEDOCUMENTO%TYPE                  , 
                                             PAFIDDOCUMENTO                 IN    DIGWEB.DOCTOSBASE.FIDDOCUMENTO%TYPE                   )

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0; 
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

       IF PAFIINOPCION = 1 THEN 

            BEGIN
            
                SELECT 1  
                INTO VFIRESULT 
                FROM DUAL
                WHERE EXISTS (SELECT FIOPEDOCUMENTO,FIDDOCUMENTO                          
                              FROM digweb.DOCTOSBASE
                              WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
                                AND FIDDOCUMENTO=PAFIDDOCUMENTO);
                IF VFIRESULT > 0 THEN 

                    OPEN VCursorsalida FOR 
                        SELECT ('El documento ya existe.') MSG FROM DUAL; 
                    RETURN VCursorsalida;             

                END IF; 
            
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
            
                INSERT INTO DIGWEB.DOCTOSBASE(FIOPEDOCUMENTO,FIDDOCUMENTO)
                VALUES(PAFIOPEDOCUMENTO,PAFIDDOCUMENTO); 
                COMMIT; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se agrego el documento') MSG FROM DUAL; 
                RETURN VCursorsalida; 
            END;
        ELSIF PAFIINOPCION = 2 THEN 

            DELETE DIGWEB.DOCTOSBASE  
            WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
        AND FIDDOCUMENTO=PAFIDDOCUMENTO;  
            COMMIT; 
            OPEN VCursorsalida FOR 
                SELECT ('Se elimino el documento') MSG FROM DUAL; 
            RETURN VCursorsalida; 
        ELSIF PAFIINOPCION = 3 THEN  

            OPEN VCursorsalida FOR 

                SELECT FIOPEDOCUMENTO,FIDDOCUMENTO
                FROM DIGWEB.DOCTOSBASE 
                WHERE FIOPEDOCUMENTO = PAFIOPEDOCUMENTO
                ORDER BY FIOPEDOCUMENTO,FIDDOCUMENTO;             
            RETURN VCursorsalida;                                                                          

        END IF; 

        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 


END PKDIGABCDOCTOS_BASE;
/


--
-- PQDGABCDIGDOCWEB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGABCDIGDOCWEB AS

/***********************************************************************************************
   NAME:                  DIGWEB.PQDGABCDIGDOCWEB 
   DESCRIPCION:           PACKAGE ADMINISTRAR EL CATALOGO DE DOCUMENTOS
   AUTOR:                 DIANA VERGARA
   FECHA CREACION:        18/07/2012
   VERSION:               1.0
   FECHA MODIFICACION:    
   NOTAS:
************************************************************************************************/

FUNCTION PADGABCCATOPERADOCTOS        (PAFIINOPCION                 IN    VARCHAR2,
                                       PAFIOPEDOCUMENTO             IN    DIGWEB.CATOPERADOCTOS.FIOPEDOCUMENTO%TYPE, 
                                       PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE, 
                                       PAFCDESCCORTA                IN    DIGWEB.CATOPERADOCTOS.FCDESCCORTA%TYPE, 
                                       PAFCEMPACTUALIZA             IN    DIGWEB.CATOPERADOCTOS.FCEMPACTUALIZA%TYPE)
                                   
RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0; 
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN
        IF PAFIINOPCION = '1' THEN 
        
            OPEN VCursorsalida FOR    

                SELECT FIOPEDOCUMENTO,FCDESCOPERADOCTO,FCDESCCORTA,FCEMPACTUALIZA 
                FROM DIGWEB.CATOPERADOCTOS
                ORDER BY FIOPEDOCUMENTO DESC;              

            RETURN VCursorsalida;   
        
        ELSIF PAFIINOPCION = '2' THEN  
            
            OPEN VCursorsalida FOR    

                SELECT FIOPEDOCUMENTO,FCDESCOPERADOCTO,FCDESCCORTA,FCEMPACTUALIZA 
                FROM DIGWEB.CATOPERADOCTOS
                WHERE FCDESCOPERADOCTO LIKE '%' || PAFCDESCOPERADOCTO || '%' 
                ORDER BY FIOPEDOCUMENTO;              

            RETURN VCursorsalida;   
       
        ELSIF PAFIINOPCION = '3' THEN 
        
                BEGIN 

                 SELECT 1 
                 INTO VFIRESULT 
                 FROM DUAL 
                 WHERE EXISTS(SELECT FIOPEDOCUMENTO 
                              FROM DIGWEB.CATOPERADOCTOS
                              WHERE FCDESCOPERADOCTO = PAFCDESCOPERADOCTO); 

                 IF VFIRESULT > 0 THEN 

                     OPEN VCursorsalida FOR 
                        
                        SELECT ('El producto ' || FIOPEDOCUMENTO || '-' || FCDESCOPERADOCTO || ' ya existe.') MSG  
                        FROM DIGWEB.CATOPERADOCTOS
                        WHERE FCDESCOPERADOCTO = PAFCDESCOPERADOCTO;
                         
                     RETURN VCursorsalida;             

                 END IF; 

             EXCEPTION 
             WHEN NO_DATA_FOUND THEN     
        
            SELECT NVL(MAX(FIOPEDOCUMENTO),0) + 1 
                INTO VFIID 
                FROM DIGWEB.CATOPERADOCTOS;
            
            INSERT INTO DIGWEB.CATOPERADOCTOS (FIOPEDOCUMENTO,FCDESCOPERADOCTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA)
            VALUES(VFIID,paFCDESCOPERADOCTO,paFCDESCCORTA,TO_DATE(SYSDATE,'dd/mm/yyyy'),paFCEMPACTUALIZA);
            COMMIT;
            
            OPEN VCursorsalida FOR 
                    SELECT ('Se agrego el nuevo producto con ID: ' || VFIID) MSG, VFIID FIOPEDOCUMENTO, PAFCDESCOPERADOCTO FCDESCOPERADOCTO FROM DUAL; 
            RETURN VCursorsalida; 
        END;
        
        
        END IF; 

        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG, -1 PAFIOPEDOCUMENTO, '' PAFCDESCOPERADOCTO FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG, -1 PAFIOPEDOCUMENTO, '' PAFCDESCOPERADOCTO FROM DUAL; 
        RETURN VCursorsalida; 
END; 


    FUNCTION PADGABCCATDESCDOCTOS     (PAFIINOPCION                 IN    VARCHAR2,
                                       PAFIIDDOCUMENTO              IN    DIGWEB.CATDESCDOCUMENTOS.FIIDDOCUMENTO%TYPE, 
                                       PAFCDESCDOCUMENTO            IN    DIGWEB.CATDESCDOCUMENTOS.FCDESCDOCUMENTO%TYPE, 
                                       PAFCDESCCORTA                IN    DIGWEB.CATDESCDOCUMENTOS.FCDESCCORTA%TYPE, 
                                       PAFCPROPIETARIO              IN    DIGWEB.CATDESCDOCUMENTOS.FCPROPIETARIO%TYPE, 
                                       PAFCORIGENDOCTO              IN    DIGWEB.CATDESCDOCUMENTOS.FCORIGENDOCTO%TYPE, 
                                       PAFCEMPACTUALIZA             IN    DIGWEB.CATDESCDOCUMENTOS.FCEMPACTUALIZA%TYPE) 
   
RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0; 
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300);

BEGIN 
    BEGIN
        IF PAFIINOPCION = '1' THEN 
        
            OPEN VCursorsalida FOR   
            
                SELECT FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FCPROPIETARIO,
                FCORIGENDOCTO,FCEMPACTUALIZA,FIDOCSUCID 
                FROM DIGWEB.CATDESCDOCUMENTOS 
                ORDER BY FCDESCDOCUMENTO;
                
            RETURN VCursorsalida;  
        
        ELSIF PAFIINOPCION = '2' THEN
        
              BEGIN 

                 SELECT 1 
                 INTO VFIRESULT 
                 FROM DUAL 
                 WHERE EXISTS(SELECT FIIDDOCUMENTO 
                              FROM DIGWEB.CATDESCDOCUMENTOS
                              WHERE FCDESCDOCUMENTO = PAFCDESCDOCUMENTO); 
                
                IF VFIRESULT > 0 THEN 

                     OPEN VCursorsalida FOR 
                     
                         SELECT ('El documento ' || FIIDDOCUMENTO || '-' || FCDESCDOCUMENTO || ' ya existe.') MSG 
                         FROM DIGWEB.CATDESCDOCUMENTOS 
                         WHERE FCDESCDOCUMENTO = PAFCDESCDOCUMENTO;
                                                        
                     RETURN VCursorsalida;             

                 END IF; 
                 
             EXCEPTION 
             WHEN NO_DATA_FOUND THEN 
                
                SELECT NVL(MAX(FIIDDOCUMENTO),0) + 1 
                INTO VFIID 
                FROM DIGWEB.CATDESCDOCUMENTOS;
                
                INSERT INTO DIGWEB.CATDESCDOCUMENTOS 
                VALUES (VFIID, PAFCDESCDOCUMENTO, PAFCDESCCORTA, PAFCPROPIETARIO, 
                PAFCORIGENDOCTO, SYSDATE, PAFCEMPACTUALIZA, NULL);
                COMMIT;

            OPEN VCursorsalida FOR 
                    SELECT ('Se agrego el nuevo documento con ID: ' || VFIID ) MSG, VFIID FIIDDOCUMENTO, PAFCDESCDOCUMENTO FCDESCDOCUMENTO FROM DUAL; 
            RETURN VCursorsalida;
            
            END; 
        
        END IF; 
        
       EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG, -1 PAFIIDDOCUMENTO, '' PAFCDESCDOCUMENTO FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG, -1 PAFIIDDOCUMENTO, '' PAFCDESCDOCUMENTO FROM DUAL; 
        RETURN VCursorsalida; 
END; 

FUNCTION PADGTGETSUBPRODUCTOS         (PAFCDESCOPERADOCTO             IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE) 
   
RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300);

 
    BEGIN
            OPEN VCursorsalida FOR    

                SELECT DISTINCT FISUBPRODUCTO, FIOPEDOCUMENTO 
                FROM DIGWEB.ORDERDOCS 
                WHERE FIOPEDOCUMENTO = (SELECT FIOPEDOCUMENTO 
                FROM DIGWEB.CATOPERADOCTOS 
                WHERE FCDESCOPERADOCTO = PAFCDESCOPERADOCTO
                AND ROWNUM = 1)
                ORDER BY FISUBPRODUCTO;
           
            RETURN VCursorsalida;  
            
        EXCEPTION
        WHEN OTHERS THEN
            OPEN VCursorsalida FOR
                SELECT ('No existe informacion del producto ' || PAFCDESCOPERADOCTO) MSG FROM DUAL;
            RETURN VCursorsalida;  
    END; 
       

FUNCTION PADGTGETETAPAS        (PAFIOPEDOCUMENTO             IN    DIGWEB.ORDERDOCS.FIOPEDOCUMENTO%TYPE,
                                PAFISUBPRODUCTO              IN    DIGWEB.ORDERDOCS.FISUBPRODUCTO%TYPE) 
   
RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0; 
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300);

BEGIN
            OPEN VCursorsalida FOR    

                SELECT DISTINCT FIETAPA 
                FROM DIGWEB.ORDERDOCS 
                WHERE FISUBPRODUCTO = PAFISUBPRODUCTO
                AND FIOPEDOCUMENTO = PAFIOPEDOCUMENTO  
                ORDER BY FIETAPA;             

            RETURN VCursorsalida;  
            
        EXCEPTION
        WHEN OTHERS THEN
            OPEN VCursorsalida FOR
                SELECT ('No existe informacion del producto ' || PAFIOPEDOCUMENTO) MSG FROM DUAL; 
            RETURN VCursorsalida;  
END; 
        

FUNCTION PADGTGETDOCUMENTOS         (PAFIOPEDOCUMENTO             IN    DIGWEB.ORDERDOCS.FIOPEDOCUMENTO%TYPE,
                                     PAFIETAPA                    IN    DIGWEB.ORDERDOCS.FIETAPA%TYPE,
                                     PAFISUBPRODUCTO              IN    DIGWEB.ORDERDOCS.FISUBPRODUCTO%TYPE) 
   
RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0; 
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300);


    BEGIN
            OPEN VCursorsalida FOR    

                 SELECT O.FIOPEDOCUMENTO, O.FISUBPRODUCTO, O.FIETAPA, O.FIDDOCUMENTO,  O.IDTABLA, B.FCDESCDOCUMENTO 
                 FROM DIGWEB.ORDERDOCS O, DIGWEB.CATDESCDOCUMENTOS B
                 WHERE O.FIETAPA = PAFIETAPA   
                 AND O.FIOPEDOCUMENTO = PAFIOPEDOCUMENTO 
                 AND O.FISUBPRODUCTO = PAFISUBPRODUCTO
                 AND O.FIDDOCUMENTO = B.FIIDDOCUMENTO
                 ORDER BY IDTABLA;           

            RETURN VCursorsalida;  
            
        EXCEPTION
        WHEN OTHERS THEN
            OPEN VCursorsalida FOR
                SELECT 'No existe informacion' MSG FROM DUAL;
            RETURN VCursorsalida;  
    END; 
        

FUNCTION PADGTDELDOC                 (PAFIOPEDOCUMENTO              IN    DIGWEB.ORDERDOCS.FIOPEDOCUMENTO%TYPE,
                                      PAFISUBPRODUCTO               IN    DIGWEB.ORDERDOCS.FISUBPRODUCTO%TYPE,
                                      PAFIETAPA                     IN    DIGWEB.ORDERDOCS.FIETAPA%TYPE,
                                      PAFIDDOCUMENTO                IN    DIGWEB.ORDERDOCS.FIDDOCUMENTO%TYPE)  
    
RETURN DIGCURSOR 
IS 

VCursorsalida DIGCURSOR; 
VFIID           NUMBER:=0;

BEGIN
        DELETE DIGWEB.CATDOCUMENTOS 
        WHERE FIOPEDOCUMENTO=paFIOPEDOCUMENTO 
        AND FIIDDOCUMENTO=paFIDDOCUMENTO 
        AND FIETAPA=paFIETAPA 
        AND FISUBPRODUCTO=paFISUBPRODUCTO ;
        
        DELETE DIGWEB.ORDERDOCS 
        WHERE FIOPEDOCUMENTO=paFIOPEDOCUMENTO 
        AND FIETAPA=paFIETAPA
        AND FISUBPRODUCTO=paFISUBPRODUCTO 
        AND FIDDOCUMENTO=paFIDDOCUMENTO;
          
    OPEN VCursorsalida FOR 
                SELECT ('Se elimino el producto') MSG FROM DUAL; 
    RETURN VCursorsalida; 
            
EXCEPTION
        WHEN OTHERS THEN
             OPEN VCursorsalida FOR 
                SELECT 'No existe informacion' MSG FROM DUAL;
            RETURN VCursorsalida; 
END;

FUNCTION PADGTSETDOCUMENTOS           (PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE,
                                       PAFIETAPA                    IN    DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE,
                                       PAFISUBPRODUCTO              IN    DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE,
                                       PAFCDESCDOCUMENTO            IN    DIGWEB.CATDESCDOCUMENTOS.FCDESCDOCUMENTO%TYPE,
                                       PAFCEMPACTUALIZA             IN    DIGWEB.CATDOCUMENTOS.FCEMPACTUALIZA%TYPE,
                                       PAFISTATUS                   IN    DIGWEB.CATDOCUMENTOS.FISTATUS%TYPE,
                                       PAFIIDTABLA                  IN    DIGWEB.CATDOCUMENTOS.FIIDTABLA%TYPE)
                                       
RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0;
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0;
VFIIDDOC        NUMBER:=0;
VFIOPDOC        NUMBER:=0;
VFCDESC        VARCHAR2(300);
VFCERRORSQL     VARCHAR2(300);

BEGIN 
    BEGIN
           
            SELECT FIOPEDOCUMENTO INTO VFIOPDOC 
            FROM DIGWEB.CATOPERADOCTOS 
            WHERE FCDESCOPERADOCTO = PAFCDESCOPERADOCTO
            AND ROWNUM = 1;
            
            SELECT FIIDDOCUMENTO INTO VFIIDDOC 
            FROM DIGWEB.CATDESCDOCUMENTOS 
            WHERE FCDESCDOCUMENTO = PAFCDESCDOCUMENTO
            AND ROWNUM = 1;
            
            SELECT FCDESCCORTA INTO VFCDESC 
            FROM DIGWEB.CATDESCDOCUMENTOS 
            WHERE FCDESCDOCUMENTO = PAFCDESCDOCUMENTO
            AND ROWNUM = 1;
            
            BEGIN 

                 SELECT 1 
                 INTO VFIRESULT 
                 FROM DUAL 
                 WHERE EXISTS(SELECT FIIDDOCUMENTO 
                              FROM DIGWEB.CATDOCUMENTOS
                              WHERE FIOPEDOCUMENTO = VFIOPDOC 
                              AND FIIDDOCUMENTO = VFIIDDOC 
                              AND FISUBPRODUCTO = PAFISUBPRODUCTO
                              AND FIETAPA = PAFIETAPA); 
                
                IF VFIRESULT > 0 THEN 

                     OPEN VCursorsalida FOR 
                     
                         SELECT ('El documento ya existe en esa etapa') MSG FROM DUAL; 
                         
                     RETURN VCursorsalida;             

                 END IF; 
                 
                 EXCEPTION 
             WHEN NO_DATA_FOUND THEN 
                
                INSERT INTO DIGWEB.CATDOCUMENTOS (FIOPEDOCUMENTO,FIIDDOCUMENTO,FCDESCDOCUMENTO,FCDESCCORTA,FDFECULTACTUALIZACION,FCEMPACTUALIZA,FISTATUS,FIETAPA,FISUBPRODUCTO, FIIDTABLA)
                values(VFIOPDOC, VFIIDDOC,PAFCDESCDOCUMENTO,VFCDESC,SYSDATE,paFCEMPACTUALIZA,paFISTATUS,paFIETAPA,paFISUBPRODUCTO, PAFIIDTABLA);
                
                SELECT nvl(max(ORDERDOC),0)+1 max into VFIID  FROM DIGWEB.ORDERDOCS WHERE FIOPEDOCUMENTO=VFIOPDOC AND FISUBPRODUCTO = paFISUBPRODUCTO AND FIETAPA=paFIETAPA;
 
                INSERT INTO DIGWEB.ORDERDOCS (ORDERDOC, FIOPEDOCUMENTO, FIETAPA, FISUBPRODUCTO, FIDDOCUMENTO, IDTABLA) 
                VALUES(VFIID, VFIOPDOC, PAFIETAPA, PAFISUBPRODUCTO, VFIIDDOC, PAFIIDTABLA);
                
                COMMIT;  

                OPEN VCursorsalida FOR 
                        SELECT ('Se agregó el documento: ' || VFIID || '-' || PAFCDESCDOCUMENTO || ', Etapa: ' || PAFIETAPA || ', Subproducto: ' || PAFISUBPRODUCTO ) MSG FROM DUAL; 
                RETURN VCursorsalida;  
            
            END; 
                           
         EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG, '' PAFCDESCOPERADOCTO FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG, '' PAFCDESCDOCUMENTO FROM DUAL; 
        RETURN VCursorsalida; 
END;     

FUNCTION FNDGTGETSUBPROD (PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE) 
RETURN DIGCURSOR 
IS  
DIGCURSALIDA DIGCURSOR;

VFIID           NUMBER:=0;

BEGIN
     OPEN DIGCURSALIDA FOR
          SELECT nvl(max(FISUBPRODUCTO),0)+1 MAX 
          FROM DIGWEB.ORDERDOCS 
          WHERE FIOPEDOCUMENTO = (SELECT FIOPEDOCUMENTO 
                FROM DIGWEB.CATOPERADOCTOS 
                WHERE FCDESCOPERADOCTO = PAFCDESCOPERADOCTO); 
     RETURN DIGCURSALIDA;     
EXCEPTION
        WHEN OTHERS THEN
            OPEN DIGCURSALIDA FOR
                SELECT 'No existe informacion' MSG FROM DUAL;
            RETURN DIGCURSALIDA;  
END;

FUNCTION FNDGTGETETAPA (PAFCDESCOPERADOCTO           IN    DIGWEB.CATOPERADOCTOS.FCDESCOPERADOCTO%TYPE,
                        paFISUBPRODUCTO IN NUMBER) 
RETURN DIGCURSOR 
IS  
DIGCURSALIDA DIGCURSOR;

VFIID           NUMBER:=0;

BEGIN
     OPEN DIGCURSALIDA FOR
          SELECT nvl(max(FIETAPA),0)+1 MAX  
          FROM DIGWEB.ORDERDOCS 
          WHERE FISUBPRODUCTO = paFISUBPRODUCTO 
          AND FIOPEDOCUMENTO=(SELECT FIOPEDOCUMENTO 
                FROM DIGWEB.CATOPERADOCTOS 
                WHERE FCDESCOPERADOCTO = PAFCDESCOPERADOCTO);
          
          
     RETURN DIGCURSALIDA;     
EXCEPTION
        WHEN OTHERS THEN
            OPEN DIGCURSALIDA FOR
                SELECT 'No existe informacion' MSG FROM DUAL;
            RETURN DIGCURSALIDA;  
END;

FUNCTION FNDGTSETLLAVE (PAFCDESCSERV           IN    DIGWEB.TASERVCOLUMN.FCDESCSERV%TYPE,
                        PAFCCLUMNA             IN    DIGWEB.TASERVCOLUMN.FCCLUMNA%TYPE,
                        PAFCTIPOCOLUMNA        IN    DIGWEB.TASERVCOLUMN.FCTIPOCOLUMNA%TYPE) 
RETURN DIGCURSOR 
IS  
VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0;

BEGIN
     
     INSERT INTO DIGWEB.TASERVCOLUMN (FCDESCSERV,FCCLUMNA,FCTIPOCOLUMNA) 
     VALUES (PAFCDESCSERV,PAFCCLUMNA,paFCTIPOCOLUMNA);
        COMMIT;
     
     OPEN VCursorsalida FOR 
          SELECT (PAFCCLUMNA || ' ' || PAFCTIPOCOLUMNA) MSG FROM DUAL; 
     RETURN VCursorsalida;  
     
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

                                      
END PQDGABCDIGDOCWEB;
/


--
-- PQDGMANTIMX01  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGMANTIMX01 AS

PROCEDURE SPACTUALIZAEDO(
    PAAPPIMX            IN        DIGWEB.IMX01.APPIMX%TYPE          ,
    PAIMX03             IN        DIGWEB.IMX01.IMX03%TYPE           ,
    PAIMX02             IN        DIGWEB.IMX01.IMX02%TYPE           ,
    PAEDOIMX            IN        DIGWEB.IMX01.EDOIMX%TYPE          ,
    PACODERR            OUT       INTEGER                           ,
    PADESCERR           OUT       VARCHAR2
)
IS
IDDOCTO        NUMBER:=0;
BEGIN
    BEGIN
        SELECT EXPIMX
            INTO IDDOCTO
            FROM DIGWEB.IMX01
            WHERE APPIMX = PAAPPIMX
            AND IMX03 = PAIMX03
            AND IMX02 = PAIMX02;
                    
            BEGIN
                UPDATE DIGWEB.IMX01
                    SET EDOIMX = PAEDOIMX
				WHERE APPIMX = PAAPPIMX
				AND IMX02 = PAIMX02
				AND IMX03 = PAIMX03;
                COMMIT;

                PACODERR := 0;
                PADESCERR :='SE ACTUALIZO EL STATUS';

                EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                    PACODERR := 1;
                    PADESCERR := 'NO EXISTE DICHA INFORMACION';
                END;

                EXCEPTION 
             WHEN OTHERS THEN
                BEGIN
                    PACODERR := 1;
                    PADESCERR := SQLERRM;
                END;
            END;
    
    IF    PACODERR = 1 THEN
        ROLLBACK;
            PADESCERR := 'SE REALIZO ROLLBACK ERROR : ' || PADESCERR;
    END IF;

    EXCEPTION
        WHEN OTHERS THEN
        PADESCERR := 'ERROR EN PROCEDIMIENTO->[DIGWEB.PQDGMANTIMX01.SPACTUALIZAEDO] ' || SQLCODE || ' - ' || SQLERRM;
            
END SPACTUALIZAEDO;

END PQDGMANTIMX01;


--PERMISOS DEL PAQUETE AL USUARIO USRDIGWEB
/


--
-- PQDGTENCABEZADOVISOR  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGTENCABEZADOVISOR AS



FUNCTION FNDGTGETOPCIONBYID    (PAFIIDENCABEZADO     IN     DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE)         
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 

      OPEN VCURSORSALIDA FOR 
           SELECT FIIDENCABEZADO, FCAPPIMX, FCABREVIATURA, FCDESCRIPCION, FCCAMPOIMX, FINUMORDEN, FCVISORTITULO, FCIMAGEN,'OK' AS MSG
           FROM DIGWEB.TADGENCABEZADOVISOR 
           WHERE  FIIDENCABEZADO= PAFIIDENCABEZADO
           order by FINUMORDEN;
      RETURN VCURSORSALIDA;  

EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



FUNCTION FNDGTGETRANGOID    (paID    IN     DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE,
                             paID2   IN     DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE)         
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 

      OPEN VCURSORSALIDA FOR 
           SELECT FIIDENCABEZADO, FCAPPIMX, FCABREVIATURA, FCDESCRIPCION, FCCAMPOIMX, FINUMORDEN, FCVISORTITULO, FCIMAGEN,'OK' AS MSG
           FROM DIGWEB.TADGENCABEZADOVISOR 
           WHERE  FIIDENCABEZADO BETWEEN paID  AND paID2
           order by FIIDENCABEZADO;
      RETURN VCURSORSALIDA;  

EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



FUNCTION FNDGTGETIDENCBYAPPIMX   (PAFCAPPIMX    IN     DIGWEB.TADGENCABEZADOVISOR.FCAPPIMX%TYPE)          
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 
       OPEN VCURSORSALIDA FOR 
           SELECT NVL (MIN( FIIDENCABEZADO),0) AS FIID  
           FROM DIGWEB.TADGENCABEZADOVISOR
           WHERE  FCAPPIMX= PAFCAPPIMX;  
      RETURN VCURSORSALIDA;  

EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;





FUNCTION FNDGTGETIDENCBYAPPIMXREG   (PAFCAPPIMX    IN     DIGWEB.TADGENCABEZADOVISOR.FCAPPIMX%TYPE)          
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 
       OPEN VCURSORSALIDA FOR 
           SELECT FIIDENCABEZADO, FCAPPIMX, FCABREVIATURA, FCDESCRIPCION, FCCAMPOIMX, FINUMORDEN, FCVISORTITULO, FCIMAGEN,'OK' AS MSG
           FROM DIGWEB.TADGENCABEZADOVISOR 
           WHERE  FCAPPIMX= PAFCAPPIMX
           ORDER BY FIIDENCABEZADO,FINUMORDEN;  
      RETURN VCURSORSALIDA;  

EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;




FUNCTION FNDGICAB   (paFIIDENCABEZADO  IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE ,
                     paFCAPPIMX        IN DIGWEB.TADGENCABEZADOVISOR.FCAPPIMX%TYPE       , 
                     paFISERIAL        IN DIGWEB.TADGENCABEZADOVISOR.FISERIAL%TYPE       , 
                     paFCABREVIATURA   IN DIGWEB.TADGENCABEZADOVISOR.FCABREVIATURA%TYPE  ,
                     paFCDESCRIPCION   IN DIGWEB.TADGENCABEZADOVISOR.FCDESCRIPCION%TYPE  ,
                     paFCCAMPOIMX      IN DIGWEB.TADGENCABEZADOVISOR.FCCAMPOIMX%TYPE     ,
                     paFINUMORDEN      IN DIGWEB.TADGENCABEZADOVISOR.FINUMORDEN%TYPE     ,
                     paFCVISORTITULO   IN DIGWEB.TADGENCABEZADOVISOR.FCVISORTITULO%TYPE  ,
                     paFCIMAGEN        IN DIGWEB.TADGENCABEZADOVISOR.FCIMAGEN%TYPE       ,
                     paFCUSRMODIFICO   IN DIGWEB.TADGENCABEZADOVISOR.FCUSRMODIFICO%TYPE)      
RETURN DIGCURSOR
IS

VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 
        INSERT INTO DIGWEB.TADGENCABEZADOVISOR (FIIDENCABEZADO,FCAPPIMX,FISERIAL,FCABREVIATURA,FCDESCRIPCION,FCCAMPOIMX,FINUMORDEN,FCVISORTITULO,FCIMAGEN,FDALTA,FCUSRMODIFICO)
        values(paFIIDENCABEZADO,paFCAPPIMX,paFISERIAL,paFCABREVIATURA,paFCDESCRIPCION,paFCCAMPOIMX,paFINUMORDEN,paFCVISORTITULO,paFCIMAGEN,sysdate,paFCUSRMODIFICO);
        COMMIT;
       
        OPEN VCURSORSALIDA FOR 
          SELECT ('Se agrego nuevo registro') MSG FROM DUAL;
        RETURN VCURSORSALIDA;   
EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



FUNCTION FNDGICABOR  (paOPERACION      IN NUMBER                                         ,
                     paFIIDENCABEZADO  IN DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE ,
                     paFCAPPIMX        IN DIGWEB.TADGENCABEZADOVISOR.FCAPPIMX%TYPE       , 
                     paFISERIAL        IN DIGWEB.TADGENCABEZADOVISOR.FISERIAL%TYPE       , 
                     paFCABREVIATURA   IN DIGWEB.TADGENCABEZADOVISOR.FCABREVIATURA%TYPE  ,
                     paFCDESCRIPCION   IN DIGWEB.TADGENCABEZADOVISOR.FCDESCRIPCION%TYPE  ,
                     paFCCAMPOIMX      IN DIGWEB.TADGENCABEZADOVISOR.FCCAMPOIMX%TYPE     ,
                     paFINUMORDEN      IN DIGWEB.TADGENCABEZADOVISOR.FINUMORDEN%TYPE     ,
                     paFCVISORTITULO   IN DIGWEB.TADGENCABEZADOVISOR.FCVISORTITULO%TYPE  ,
                     paFCIMAGEN        IN DIGWEB.TADGENCABEZADOVISOR.FCIMAGEN%TYPE       ,
                     paFCUSRMODIFICO   IN DIGWEB.TADGENCABEZADOVISOR.FCUSRMODIFICO%TYPE)      
RETURN DIGCURSOR
IS

VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);
VGSERIAL        NUMBER:=0; 
BEGIN 
        
  IF paOperacion=1 THEN  
       SELECT NVL(MAX(FISERIAL) , 0)
        INTO VGSERIAL
        FROM DIGWEB.TADGENCABEZADOVISOR   
        WHERE  FIIDENCABEZADO=paFIIDENCABEZADO
        AND FCAPPIMX=paFCAPPIMX;

        INSERT INTO DIGWEB.TADGENCABEZADOVISOR (FIIDENCABEZADO,FCAPPIMX,FISERIAL,FCABREVIATURA,FCDESCRIPCION,FCCAMPOIMX,FINUMORDEN,FCVISORTITULO,FCIMAGEN,FDALTA,FCUSRMODIFICO)
        values(paFIIDENCABEZADO,paFCAPPIMX,VGSERIAL+1,paFCABREVIATURA,paFCDESCRIPCION,paFCCAMPOIMX,paFINUMORDEN,paFCVISORTITULO,paFCIMAGEN,sysdate,paFCUSRMODIFICO);
        COMMIT;
       
        OPEN VCURSORSALIDA FOR 
          SELECT ('Se agrego nuevo registro') MSG FROM DUAL;
        RETURN VCURSORSALIDA;    
    ELSIF paOperacion=2 THEN 
        SELECT NVL(MAX(FISERIAL) , 0) +1 
        INTO VGSERIAL
        FROM DIGWEB.TADGENCABEZADOVISOR   
        WHERE  FIIDENCABEZADO=paFIIDENCABEZADO
        AND FCAPPIMX=paFCAPPIMX;

        INSERT INTO DIGWEB.TADGENCABEZADOVISOR (FIIDENCABEZADO,FCAPPIMX,FISERIAL,FCABREVIATURA,FCDESCRIPCION,FCCAMPOIMX,FINUMORDEN,FCVISORTITULO,FCIMAGEN,FDALTA,FCUSRMODIFICO)
        values(paFIIDENCABEZADO,paFCAPPIMX,VGSERIAL,paFCABREVIATURA,paFCDESCRIPCION,paFCCAMPOIMX,paFINUMORDEN,paFCVISORTITULO,paFCIMAGEN,sysdate,paFCUSRMODIFICO);
        COMMIT;
       
        OPEN VCURSORSALIDA FOR 
          SELECT ('Se agrego nuevo registro') MSG FROM DUAL;
        RETURN VCURSORSALIDA; 
    END IF;  

         
EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



FUNCTION  FNDGDCAB   (paOPERACION        IN   NUMBER                                         , 
                      paFIIDENCABEZADO   IN   DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE ,
                      paFISERIAL         IN   DIGWEB.TADGENCABEZADOVISOR.FISERIAL%TYPE       ) 
RETURN DIGCURSOR
IS

VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 
    IF paOperacion=1 THEN  
      DELETE FROM DIGWEB.TADGENCABEZADOVISOR WHERE  FIIDENCABEZADO=paFIIDENCABEZADO AND  FISERIAL=paFISERIAL;
      COMMIT; 
      
      OPEN VCURSORSALIDA FOR 
      SELECT ('Se borro el registro: ' || paFISERIAL ||'  del encabezado :'  ||  paFIIDENCABEZADO) MSG FROM DUAL;
      RETURN VCURSORSALIDA;      
    ELSIF paOperacion=2 THEN 
           DELETE FROM DIGWEB.TADGENCABEZADOVISOR WHERE  FIIDENCABEZADO=paFIIDENCABEZADO;
           COMMIT;
           
           OPEN VCURSORSALIDA FOR 
           SELECT ('Se borraron los registros del id:' || paFIIDENCABEZADO) MSG FROM DUAL;
           RETURN VCURSORSALIDA;
    END IF;  
      
EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;







FUNCTION  FNDGUCABG   (paFIIDENCABEZADO   IN     DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE,
                       paFCABREVIATURA    IN     DIGWEB.TADGENCABEZADOVISOR.FCABREVIATURA%TYPE , 
                       paFCVISORTITULO    IN     DIGWEB.TADGENCABEZADOVISOR.FCVISORTITULO%TYPE ,
                       paFCIMAGEN         IN     DIGWEB.TADGENCABEZADOVISOR.FCIMAGEN%TYPE      ,
                       paFCUSRMODIFICO    IN     DIGWEB.TADGENCABEZADOVISOR.FCUSRMODIFICO%TYPE ) 
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 
      UPDATE DIGWEB.TADGENCABEZADOVISOR SET FCABREVIATURA=paFCABREVIATURA,
                                            FCVISORTITULO=paFCVISORTITULO,
                                            FCIMAGEN=paFCIMAGEN,
                                            FCUSRMODIFICO=paFCUSRMODIFICO
                                            WHERE FIIDENCABEZADO=paFIIDENCABEZADO; 
      COMMIT;    
      OPEN VCURSORSALIDA FOR 
      SELECT ('Se actualizaron los registros del id: ' || paFIIDENCABEZADO) MSG FROM DUAL;
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;




FUNCTION  FNDGUCABE   (paFIIDENCABEZADO   IN     DIGWEB.TADGENCABEZADOVISOR.FIIDENCABEZADO%TYPE,
                       paFISERIAL         IN     DIGWEB.TADGENCABEZADOVISOR.FISERIAL%TYPE      ,
                       paFCDESCRIPCION    IN     DIGWEB.TADGENCABEZADOVISOR.FCDESCRIPCION%TYPE , 
                       paFCCAMPOIMX       IN     DIGWEB.TADGENCABEZADOVISOR.FCCAMPOIMX%TYPE    ,
                       paFINUMORDEN       IN     DIGWEB.TADGENCABEZADOVISOR.FINUMORDEN%TYPE    ,
                       paFCUSRMODIFICO    IN     DIGWEB.TADGENCABEZADOVISOR.FCUSRMODIFICO%TYPE ) 
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 
      UPDATE DIGWEB.TADGENCABEZADOVISOR SET FCDESCRIPCION=paFCDESCRIPCION,
                                            FCCAMPOIMX=paFCCAMPOIMX,
                                            FINUMORDEN=paFINUMORDEN,
                                            FCUSRMODIFICO=paFCUSRMODIFICO
                                            WHERE FIIDENCABEZADO=paFIIDENCABEZADO
                                            AND FISERIAL=paFISERIAL;  
      COMMIT;    
      OPEN VCURSORSALIDA FOR 
      SELECT ('Se actualizo el registro del id: ' || paFIIDENCABEZADO || 'serial :'|| paFISERIAL) MSG FROM DUAL;
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN    
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



   
END PQDGTENCABEZADOVISOR;
/


--
-- PQDGURECHUM  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGURECHUM AS 
 
PROCEDURE SPDGURECHUM (paIMX01          IN      DIGWEB.IMX01.IMX01%TYPE,
                       paIMX02          IN      DIGWEB.IMX01.IMX02%TYPE,
                       paIMX03          IN      DIGWEB.IMX01.IMX03%TYPE
                     )
IS

BEGIN    

        UPDATE DIGWEB.IMX01 SET IMX01=paIMX02 || '-' || paIMX03, IMX03=paIMX03 WHERE IMX01=paIMX01 AND APPIMX='REC_HUMANOS';
        COMMIT;
EXCEPTION 
WHEN OTHERS THEN 
     ROLLBACK;    
END; 
 
END PQDGURECHUM;
/


--
-- PQDGCARGADOCTOS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGCARGADOCTOS AS

PROCEDURE SPDGIDOCTO(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX02.DOCIMX%TYPE,
                            paIDDOCIMX      IN DIGWEB.IMX02.IDDOCIMX%TYPE,
                            paNOMDOCIMX     IN DIGWEB.IMX02.NOMDOCIMX%TYPE,
                            paSTATUSIMX     IN DIGWEB.IMX02.STATUSIMX%TYPE,
                            paFISUBPRODUCTO IN DIGWEB.IMX02.FISUBPRODUCTO%TYPE,
                            paFIETAPA       IN DIGWEB.IMX02.FIETAPA%TYPE)
IS
BEGIN
    
        INSERT INTO DIGWEB.IMX02 (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA) VALUES (paAPPIMX,paEXPIMX,paDOCIMX,paIDDOCIMX,paNOMDOCIMX,paSTATUSIMX,paFISUBPRODUCTO,paFIETAPA);
        COMMIT;
    
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

FUNCTION  FNDGSMAXDOC(      paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE)
RETURN DIGCURSOR
IS
VCURSORSALIDA DIGCURSOR;
BEGIN
        OPEN VCursorsalida FOR 
            SELECT NVL(MAX(DOCIMX),0)+1   FROM DIGWEB.IMX02 WHERE APPIMX=paAPPIMX AND EXPIMX=paEXPIMX;
        RETURN VCursorsalida; 

END;


FUNCTION  FNDGSGETDOCIMX(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paIDDOCIMX      IN DIGWEB.IMX02.IDDOCIMX%TYPE)
RETURN DIGCURSOR
IS
VCURSORSALIDA DIGCURSOR;
BEGIN
        OPEN VCursorsalida FOR 
            SELECT DOCIMX   FROM DIGWEB.IMX02 WHERE APPIMX=paAPPIMX AND EXPIMX=paEXPIMX AND IDDOCIMX=paIDDOCIMX;
        RETURN VCursorsalida; 

END;

FUNCTION  FNDGSGETDOCIMXES( paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paIDDOCIMX      IN DIGWEB.IMX02.IDDOCIMX%TYPE,
                            paFISUBPRODUCTO IN DIGWEB.IMX02.FISUBPRODUCTO%TYPE,
                            paFIETAPA       IN DIGWEB.IMX02.FIETAPA%TYPE)
RETURN DIGCURSOR
IS
VCURSORSALIDA DIGCURSOR;
BEGIN
        OPEN VCursorsalida FOR 
            SELECT DOCIMX   FROM DIGWEB.IMX02 WHERE APPIMX=paAPPIMX AND EXPIMX=paEXPIMX AND IDDOCIMX=paIDDOCIMX AND FISUBPRODUCTO=PAFISUBPRODUCTO AND FIETAPA=PAFIETAPA;
        RETURN VCursorsalida; 

END;


FUNCTION  FNDGSMAXPAG(      paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX02.DOCIMX%TYPE)
RETURN DIGCURSOR
IS
VCURSORSALIDA DIGCURSOR;
BEGIN
        OPEN VCursorsalida FOR 
            SELECT NVL(MAX(PAGIMX),0) FROM DIGWEB.IMX03 WHERE APPIMX=paAPPIMX AND EXPIMX=paEXPIMX AND DOCIMX=paDOCIMX;
        RETURN VCursorsalida; 

END;

PROCEDURE SPDGIPAGINA(      paAPPIMX        IN DIGWEB.IMX03.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX03.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX03.DOCIMX%TYPE,
                            paPAGIMX        IN DIGWEB.IMX03.PAGIMX%TYPE,
                            paIMGIMX        IN DIGWEB.IMX03.IMGIMX%TYPE,
                            paRUTIMX        IN DIGWEB.IMX03.RUTIMX%TYPE,
                            paSTATUSIMX     IN DIGWEB.IMX03.STATUSIMX%TYPE,
                            paFISUBPRODUCTO IN DIGWEB.IMX03.FISUBPRODUCTO%TYPE,
                            paFIETAPA       IN DIGWEB.IMX03.FIETAPA%TYPE,
                            paUSUARIOIMX    IN DIGWEB.IMX03.USUARIOIMX%TYPE,
                            paWSIMX         IN DIGWEB.IMX03.WSIMX%TYPE)
IS
BEGIN
    
        INSERT INTO DIGWEB.IMX03 (APPIMX, EXPIMX, DOCIMX, PAGIMX, IMGIMX, RUTIMX, STATUSIMX, FISUBPRODUCTO, FIETAPA, USUARIOIMX, WSIMX, FECDICIMX) 
        VALUES (paAPPIMX,paEXPIMX,paDOCIMX, paPAGIMX, paIMGIMX, paRUTIMX, paSTATUSIMX, paFISUBPRODUCTO, paFIETAPA, paUSUARIOIMX, paWSIMX, SYSDATE);
        COMMIT;
        UPDATE DIGWEB.IMX02 SET STATUSIMX=1 WHERE APPIMX=paAPPIMX AND EXPIMX=paEXPIMX AND DOCIMX=paDOCIMX;
        COMMIT;
    
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

PROCEDURE SPDGUDOCTO(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX02.DOCIMX%TYPE)
IS
BEGIN
    
        UPDATE DIGWEB.IMX02 SET STATUSIMX=0 WHERE APPIMX=paAPPIMX AND EXPIMX=paEXPIMX AND DOCIMX=paDOCIMX;
        COMMIT;
    
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

FUNCTION  FNDGSDESCDOC(      paFIIDDOCUMENTO        IN DIGWEB.CATDESCDOCUMENTOS.FIIDDOCUMENTO%TYPE)
RETURN DIGCURSOR
IS
VCURSORSALIDA DIGCURSOR;
BEGIN
        OPEN VCursorsalida FOR 
            SELECT FCDESCDOCUMENTO FROM digweb.CATDESCDOCUMENTOS  WHERE FIIDDOCUMENTO =paFIIDDOCUMENTO;
        RETURN VCursorsalida; 

END;

PROCEDURE SPDGUSTATUSDOC(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX        IN DIGWEB.IMX02.DOCIMX%TYPE,
                            paSTATUSIMX1    IN DIGWEB.IMX02.DOCIMX%TYPE,
                            paSTATUSIMX2    IN DIGWEB.IMX02.DOCIMX%TYPE)
IS
BEGIN
    UPDATE DIGWEB.IMX03 SET STATUSIMX=paSTATUSIMX2 WHERE APPIMX=paAPPIMX AND EXPIMX=paEXPIMX AND DOCIMX=paDOCIMX AND STATUSIMX=paSTATUSIMX1;
        COMMIT;
    
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

PROCEDURE SPDGUSTATUSPAG(   paAPPIMX       IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX       IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paDOCIMX       IN DIGWEB.IMX02.DOCIMX%TYPE,
                            paPAGIMX       IN DIGWEB.IMX03.PAGIMX%TYPE,
                            paSTATUSIMX    IN DIGWEB.IMX03.STATUSIMX%TYPE)
IS
BEGIN
    UPDATE DIGWEB.IMX03 SET STATUSIMX=paSTATUSIMX WHERE APPIMX=paAPPIMX AND EXPIMX=paEXPIMX AND DOCIMX=paDOCIMX AND PAGIMX=paPAGIMX;
        COMMIT;
    
EXCEPTION
   WHEN OTHERS THEN
        ROLLBACK;
END;

END PQDGCARGADOCTOS;
/


--
-- PQDGABCDIGWEB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGABCDIGWEB AS


FUNCTION FNDGSVERIFCAIMX01       (PAFCAPPIMX           IN  DIGWEB.IMX01.APPIMX%TYPE,             
                                   PAFCIMX01              IN  DIGWEB.IMX01.IMX01%TYPE)
RETURN DIGCURSOR

IS
cCursorsalida DIGCURSOR;


BEGIN

                    
        OPEN cCursorsalida FOR
            SELECT COUNT(IMX01)  AS DETERMINA 
            FROM DIGWEB.IMX01
            WHERE APPIMX = PAFCAPPIMX AND IMX01 = PAFCIMX01;                                   
        RETURN cCursorsalida;
                    
                                
    EXCEPTION
        WHEN NO_DATA_FOUND THEN     
            OPEN cCursorsalida FOR
                SELECT 'No existe informacion' MSG FROM DUAL;
            RETURN cCursorsalida;  
END;

                                                          
FUNCTION FNDGSARMALLAVE       (PAFCAPPIMX           IN  DIGWEB.IMX01.APPIMX%TYPE)
RETURN DIGCURSOR

IS
cCursorsalida DIGCURSOR;


BEGIN

                    
        OPEN cCursorsalida FOR
            SELECT FCCLUMNA  FROM DIGWEB.TASERVCOLUMN 
            WHERE FCDESCSERV=PAFCAPPIMX AND FCTIPOCOLUMNA='K' ORDER BY FCCLUMNA;                                   
        RETURN cCursorsalida;
                    
                                
    EXCEPTION
        WHEN NO_DATA_FOUND THEN     
            OPEN cCursorsalida FOR
                SELECT 'No existe informacion' MSG FROM DUAL;
            RETURN cCursorsalida;  
END;

FUNCTION FNDGSGETRUTA(PAFCAPPIMX  IN  DIGWEB.IMX01.APPIMX%TYPE,             
                      PAFIEXPIMX  IN  DIGWEB.IMX01.EXPIMX%TYPE)  RETURN DIGCURSOR IS  DIGCURSALIDA DIGCURSOR;

BEGIN

     OPEN DIGCURSALIDA FOR
	select rutimx from digweb.imx03 where appimx=PAFCAPPIMX and expimx= PAFIEXPIMX and rownum=1;
        RETURN  DIGCURSALIDA;
EXCEPTION
    WHEN NO_DATA_FOUND THEN     
        OPEN DIGCURSALIDA FOR
            SELECT 'No existe informacion' MSG FROM DUAL;
        RETURN DIGCURSALIDA; 
END;

END PQDGABCDIGWEB;
/


--
-- PQDGDOMICILIA  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGDOMICILIA AS



FUNCTION  FNDGUDOMCRED (paCuenta     IN  DIGWEB.IMX01.IMX01%TYPE ,
                        paSucursal   IN  DIGWEB.IMX01.IMX11%TYPE ,
                        paAppimx     IN  DIGWEB.IMX01.APPIMX%TYPE,
                        paExpimx     IN  DIGWEB.IMX01.EXPIMX%TYPE)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 
      UPDATE DIGWEB.IMX01
      SET IMX09='4', 
      IMX11=paSucursal
      WHERE APPIMX=paAppimx 
      AND EXPIMX=paExpimx
      AND IMX01=paCuenta;
      
      COMMIT;    
      
      OPEN VCURSORSALIDA FOR 
      SELECT ('OK' ) MSG FROM DUAL;
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



FUNCTION  FNDGSDOMCRED (paImx01      IN  DIGWEB.IMX01.IMX01%TYPE ,
                        paAppimx     IN  DIGWEB.IMX01.APPIMX%TYPE)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 
      OPEN VCURSORSALIDA FOR 
          SELECT EXPIMX, 'OK' AS MSG
          FROM DIGWEB.IMX01
          WHERE IMX01=paImx01
          AND APPIMX=paAppimx;
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;

END PQDGDOMICILIA;
/


--
-- PKDIGABCCONTRATOSX  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PKDIGABCCONTRATOSX
AS
   /***********************************************************************************************
   NAME: DIGWEB.PKDIGABCCONTRATOSX FUNCTION FNDIGABCCATTCCATCONTRATOS
   DESCRIPCION: FUNCION QUE REALIZA ALTAS BAJAS MODIFICACIONES Y CONSULTAS DE LA TABLA DIGWEB.TCCATCONTRATOS
   AUTOR: Jesus Nieto Porras
   FECHA CREACION: 10/02/2014
   FECHA ACTUALIZACION
   VERSION: 1.0
   FECHA MODIFICACION: 07/03/2014 Agregan Opciones de Actualizacion de Datos
   NOTAS:
   ************************************************************************************************/

   FUNCTION FNDIGABCCATDIGCONTRATOSX (
      PAFIINOPCION        IN NUMBER,
      PAFIIDREG           IN DIGWEB.TCCATCONTRATOS.FIIDREG%TYPE,
      PAFCPRODUCTO        IN DIGWEB.TCCATCONTRATOS.FCPRODUCTO%TYPE,
      PAFIIDCONTRATO      IN DIGWEB.TCCATCONTRATOS.FIIDCONTRATO%TYPE,
      PAFCIDCONTRATO      IN DIGWEB.TCCATCONTRATOS.FCIDCONTRATO%TYPE,
      PAFCLLAVECONTRATO   IN DIGWEB.TCCATCONTRATOS.FCLLAVECONTRATO%TYPE,
      PAFDFECHAALTA       IN VARCHAR2,
      PAFDMODIFICACION    IN VARCHAR2,
      PAFCUSRMODIFICO     IN DIGWEB.TCCATCONTRATOS.FCUSRMODIFICO%TYPE)
      RETURN DIGCURSOR
   IS
      VCursorsalida   DIGCURSOR;

      VFIID           NUMBER := 0;
      VFIERROR        NUMBER := 0;
      VFIRESULT       NUMBER := 0;
      VFCERRORSQL     VARCHAR2 (300);
   BEGIN
      BEGIN
         IF PAFIINOPCION = 1
         THEN
            BEGIN
               SELECT 1
                 INTO VFIRESULT
                 FROM DUAL
                WHERE EXISTS
                         (SELECT FIIDREG
                            FROM DIGWEB.TCCATCONTRATOS
                           WHERE     FCPRODUCTO = PAFCPRODUCTO
                                 AND FIIDCONTRATO = PAFIIDCONTRATO
                                 AND FCIDCONTRATO = PAFCIDCONTRATO);

               IF VFIRESULT > 0
               THEN
                  OPEN VCursorsalida FOR
                     SELECT ('El documento ya existe.') MSG FROM DUAL;

                  RETURN VCursorsalida;
               END IF;
            EXCEPTION
               WHEN NO_DATA_FOUND
               THEN
                  INSERT INTO DIGWEB.TCCATCONTRATOS (FIIDREG,
                                                     FCPRODUCTO,
                                                     FIIDCONTRATO,
                                                     FCIDCONTRATO,
                                                     FCLLAVECONTRATO,
                                                     FDFECHAALTA,
                                                     FDMODIFICACION,
                                                     FCUSRMODIFICO)
                       VALUES (PAFIIDREG,
                               PAFCPRODUCTO,
                               PAFIIDCONTRATO,
                               PAFCIDCONTRATO,
                               PAFCLLAVECONTRATO,
                               TO_DATE (PAFDFECHAALTA),
                               TO_DATE (PAFDMODIFICACION),
                               PAFCUSRMODIFICO);

                  COMMIT;

                  OPEN VCursorsalida FOR
                     SELECT ('Se agrego el documento') MSG FROM DUAL;

                  RETURN VCursorsalida;
            END;
         ELSIF PAFIINOPCION = 2
         THEN
            UPDATE DIGWEB.TCCATCONTRATOS
               SET FCLLAVECONTRATO = PAFCLLAVECONTRATO,
                   FDMODIFICACION = PAFDMODIFICACION
             WHERE     FCPRODUCTO = PAFCPRODUCTO
                   AND FIIDCONTRATO = PAFIIDCONTRATO
                   AND FCIDCONTRATO = PAFCIDCONTRATO;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se actualizo el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 3
         THEN
            DELETE DIGWEB.TCCATCONTRATOS
             WHERE     FCPRODUCTO = PAFCPRODUCTO
                   AND FIIDCONTRATO = PAFIIDCONTRATO
                   AND FCIDCONTRATO = PAFCIDCONTRATO;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se elimino el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 4
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FCPRODUCTO,
                        FIIDCONTRATO,
                        FCIDCONTRATO,
                        FCLLAVECONTRATO,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TCCATCONTRATOS
                  WHERE     FCPRODUCTO = PAFCPRODUCTO
                        AND FIIDCONTRATO = PAFIIDCONTRATO
                        AND FCIDCONTRATO = PAFCIDCONTRATO
               ORDER BY FIIDREG, FCPRODUCTO;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 5
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FCPRODUCTO,
                        FIIDCONTRATO,
                        FCIDCONTRATO,
                        FCLLAVECONTRATO,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TCCATCONTRATOS
                  WHERE FCPRODUCTO = PAFCPRODUCTO
               ORDER BY FIIDREG, FCPRODUCTO;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 6
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FCPRODUCTO,
                        FIIDCONTRATO,
                        FCIDCONTRATO,
                        FCLLAVECONTRATO,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TCCATCONTRATOS
                  WHERE FCLLAVECONTRATO = PAFCLLAVECONTRATO
               ORDER BY FIIDREG, FCPRODUCTO;

            RETURN VCursorsalida;
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            BEGIN
               VFIERROR := 1;
               VFCERRORSQL := SQLERRM;
            END;
      END;

      IF VFIERROR = 1
      THEN
         ROLLBACK;

         OPEN VCursorsalida FOR
            SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG
              FROM DUAL;

         RETURN VCursorsalida;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         VFCERRORSQL := SQLERRM;

         OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL;

         RETURN VCursorsalida;
   END;

   /***********************************************************************************************
   NAME: DIGWEB.PKDIGABCCONTRATOSX FUNCTION FNDIGABCCATDIGDETCONTRATOSX
   DESCRIPCION: FUNCION QUE REALIZA ALTAS BAJAS MODIFICACIONES Y CONSULTAS DE LA TABLA DIGWEB.TCCATDETCONTRATOS
   AUTOR: Jesus Nieto Porras
   FECHA CREACION: 10/02/2014
   FECHA ACTUALIZACION
   VERSION: 1.0
   FECHA MODIFICACION:
   NOTAS:
   ************************************************************************************************/

   FUNCTION FNDIGABCCATDIGDETCONTRATOSX (
      PAFIINOPCION       IN NUMBER,
      PAFIIDREG          IN DIGWEB.TCCATDETCONTRATOS.FIIDREG%TYPE,
      PAFINOPAG          IN DIGWEB.TCCATDETCONTRATOS.FINOPAG%TYPE,
      PAFCRUTAIMAGEN     IN DIGWEB.TCCATDETCONTRATOS.FCRUTAIMAGEN%TYPE,
      PAFCDESC           IN DIGWEB.TCCATDETCONTRATOS.FCDESC%TYPE,
      PAFDFECHAALTA      IN VARCHAR2,
      PAFDMODIFICACION   IN VARCHAR2,
      PAFCUSRMODIFICO    IN DIGWEB.TCCATDETCONTRATOS.FCUSRMODIFICO%TYPE)
      RETURN DIGCURSOR
   IS
      VCursorsalida   DIGCURSOR;

      VFIID           NUMBER := 0;
      VFIERROR        NUMBER := 0;
      VFIRESULT       NUMBER := 0;
      VFCERRORSQL     VARCHAR2 (300);
   BEGIN
      BEGIN
         IF PAFIINOPCION = 1
         THEN
            BEGIN
               SELECT 1
                 INTO VFIRESULT
                 FROM DUAL
                WHERE EXISTS
                         (SELECT FIIDREG
                            FROM DIGWEB.TCCATDETCONTRATOS
                           WHERE FIIDREG = PAFIIDREG AND FINOPAG = PAFINOPAG);

               IF VFIRESULT > 0
               THEN
                  OPEN VCursorsalida FOR
                     SELECT ('El documento ya existe.') MSG FROM DUAL;

                  RETURN VCursorsalida;
               END IF;
            EXCEPTION
               WHEN NO_DATA_FOUND
               THEN
                  INSERT INTO DIGWEB.TCCATDETCONTRATOS (FIIDREG,
                                                        FINOPAG,
                                                        FCRUTAIMAGEN,
                                                        FCDESC,
                                                        FDFECHAALTA,
                                                        FDMODIFICACION,
                                                        FCUSRMODIFICO)
                       VALUES (PAFIIDREG,
                               PAFINOPAG,
                               PAFCRUTAIMAGEN,
                               PAFCDESC,
                               TO_DATE (PAFDFECHAALTA),
                               TO_DATE (PAFDMODIFICACION),
                               PAFCUSRMODIFICO);

                  COMMIT;

                  OPEN VCursorsalida FOR
                     SELECT ('Se agrego el documento') MSG FROM DUAL;

                  RETURN VCursorsalida;
            END;
         ELSIF PAFIINOPCION = 2
         THEN
            UPDATE DIGWEB.TCCATDETCONTRATOS
               SET FCRUTAIMAGEN = PAFCRUTAIMAGEN,
                   FCDESC = PAFCDESC,
                   FDMODIFICACION = PAFDMODIFICACION
             WHERE FIIDREG = PAFIIDREG AND FINOPAG = PAFINOPAG;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se actualizo el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 3
         THEN
            DELETE DIGWEB.TCCATDETCONTRATOS
             WHERE FIIDREG = PAFIIDREG AND FINOPAG = PAFINOPAG;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se elimino el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 4
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FINOPAG,
                        FCRUTAIMAGEN,
                        FCDESC,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TCCATDETCONTRATOS
                  WHERE FIIDREG = PAFIIDREG AND FINOPAG = PAFINOPAG
               ORDER BY FIIDREG, FINOPAG;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 5
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FINOPAG,
                        FCRUTAIMAGEN,
                        FCDESC,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TCCATDETCONTRATOS
                  WHERE PAFIIDREG = FIIDREG
               ORDER BY FIIDREG, FINOPAG;

            RETURN VCursorsalida;
         --Recuperar DatosaProcesar2
         ELSIF PAFIINOPCION = 6
         THEN
            OPEN VCursorsalida FOR
                 SELECT fiidreg,
                        finopag,
                        fcrutaimagen,
                        'OK' AS MSG
                   FROM DIGWEB.TCCATDETCONTRATOS
               ORDER BY fiidreg ASC, finopag ASC;

            RETURN VCursorsalida;
         --Recuperar DatosaProcesar3
         ELSIF PAFIINOPCION = 7
         THEN
            OPEN VCursorsalida FOR
                 SELECT T1.FIIDREG,
                        T1.FCPRODUCTO,
                        T1.FIIDCONTRATO,
                        T2.FINOPAG,
                        T2.FCRUTAIMAGEN,
                        T2.FCDESC,
                        'OK' AS MSG
                   FROM DIGWEB.TCCATCONTRATOS T1, DIGWEB.TCCATDETCONTRATOS T2
                  WHERE T1.FIIDREG = T2.FIIDREG AND T2.FINOPAG != 0
               ORDER BY T1.FIIDREG ASC,
                        T1.FCPRODUCTO ASC,
                        T1.FIIDCONTRATO ASC,
                        T2.FINOPAG ASC;

            RETURN VCursorsalida;
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            BEGIN
               VFIERROR := 1;
               VFCERRORSQL := SQLERRM;
            END;
      END;

      IF VFIERROR = 1
      THEN
         ROLLBACK;

         OPEN VCursorsalida FOR
            SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG
              FROM DUAL;

         RETURN VCursorsalida;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         VFCERRORSQL := SQLERRM;

         OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL;

         RETURN VCursorsalida;
   END;

   /***********************************************************************************************
   NAME: DIGWEB.PKDIGABCCONTRATOSX FUNCTION FNDIGABCTCCATCORDENADAS
   DESCRIPCION: FUNCION QUE REALIZA ALTAS BAJAS MODIFICACIONES Y CONSULTAS DE LA TABLA DIGWEB.TCCATCORDENADAS
   AUTOR: Jesus Nieto Porras
   FECHA CREACION: 10/02/2014
   FECHA ACTUALIZACION
   VERSION: 1.0
   FECHA MODIFICACION:
   NOTAS:
   ************************************************************************************************/

   FUNCTION FNDIGABCTCCATCORDENADAS (
      PAFIINOPCION       IN NUMBER,
      PAFIIDREG          IN DIGWEB.TCCATCORDENADAS.FIIDREG%TYPE,
      PAFINOPAG          IN DIGWEB.TCCATCORDENADAS.FINOPAG%TYPE,
      PAFCDESCCAMPO      IN DIGWEB.TCCATCORDENADAS.FCDESCCAMPO%TYPE,
      PAFCCORDIMAGEN     IN DIGWEB.TCCATCORDENADAS.FCCORDIMAGEN%TYPE,
      PAFCCORDTEXTO      IN DIGWEB.TCCATCORDENADAS.FCCORDTEXTO%TYPE,
      PAFDFECHAALTA      IN VARCHAR2,
      PAFDMODIFICACION   IN VARCHAR2,
      PAFCUSRMODIFICO    IN DIGWEB.TCCATCORDENADAS.FCUSRMODIFICO%TYPE)
      RETURN DIGCURSOR
   IS
      VCursorsalida   DIGCURSOR;

      VFIID           NUMBER := 0;
      VFIERROR        NUMBER := 0;
      VFIRESULT       NUMBER := 0;
      VFCERRORSQL     VARCHAR2 (300);
   BEGIN
      BEGIN
         IF PAFIINOPCION = 1
         THEN
            BEGIN
               SELECT 1
                 INTO VFIRESULT
                 FROM DUAL
                WHERE EXISTS
                         (SELECT FIIDREG
                            FROM DIGWEB.TCCATCORDENADAS
                           WHERE     FIIDREG = PAFIIDREG
                                 AND FINOPAG = PAFINOPAG
                                 AND FCDESCCAMPO = PAFCDESCCAMPO);

               IF VFIRESULT > 0
               THEN
                  OPEN VCursorsalida FOR
                     SELECT ('El documento ya existe.') MSG FROM DUAL;

                  RETURN VCursorsalida;
               END IF;
            EXCEPTION
               WHEN NO_DATA_FOUND
               THEN
                  INSERT INTO DIGWEB.TCCATCORDENADAS (FIIDREG,
                                                      FINOPAG,
                                                      FCDESCCAMPO,
                                                      FCCORDIMAGEN,
                                                      FCCORDTEXTO,
                                                      FDFECHAALTA,
                                                      FDMODIFICACION,
                                                      FCUSRMODIFICO)
                       VALUES (PAFIIDREG,
                               PAFINOPAG,
                               PAFCDESCCAMPO,
                               PAFCCORDIMAGEN,
                               PAFCCORDTEXTO,
                               TO_DATE (PAFDFECHAALTA),
                               TO_DATE (PAFDMODIFICACION),
                               PAFCUSRMODIFICO);

                  COMMIT;

                  OPEN VCursorsalida FOR
                     SELECT ('Se agrego el documento') MSG FROM DUAL;

                  RETURN VCursorsalida;
            END;
         ELSIF PAFIINOPCION = 2
         THEN
            UPDATE DIGWEB.TCCATCORDENADAS
               SET FCCORDIMAGEN = PAFCCORDIMAGEN,
                   FCCORDTEXTO = PAFCCORDTEXTO,
                   FDMODIFICACION = PAFDMODIFICACION
             WHERE     FIIDREG = PAFIIDREG
                   AND FINOPAG = PAFINOPAG
                   AND FCDESCCAMPO = PAFCDESCCAMPO;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se actualizo el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 3
         THEN
            DELETE DIGWEB.TCCATCORDENADAS
             WHERE     FIIDREG = PAFIIDREG
                   AND FINOPAG = PAFINOPAG
                   AND FCDESCCAMPO = PAFCDESCCAMPO;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se elimino el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 4
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FINOPAG,
                        FCDESCCAMPO,
                        FCCORDIMAGEN,
                        FCCORDTEXTO,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TCCATCORDENADAS
                  WHERE     FIIDREG = PAFIIDREG
                        AND FINOPAG = PAFINOPAG
                        AND FCDESCCAMPO = PAFCDESCCAMPO
               ORDER BY FIIDREG, FINOPAG;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 5
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FINOPAG,
                        FCDESCCAMPO,
                        FCCORDIMAGEN,
                        FCCORDTEXTO,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TCCATCORDENADAS
                  WHERE FIIDREG = PAFIIDREG AND FINOPAG = PAFINOPAG
               ORDER BY FIIDREG, FINOPAG;

            RETURN VCursorsalida;
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            BEGIN
               VFIERROR := 1;
               VFCERRORSQL := SQLERRM;
            END;
      END;

      IF VFIERROR = 1
      THEN
         ROLLBACK;

         OPEN VCursorsalida FOR
            SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG
              FROM DUAL;

         RETURN VCursorsalida;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         VFCERRORSQL := SQLERRM;

         OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL;

         RETURN VCursorsalida;
   END;

   /***********************************************************************************************
   NAME: DIGWEB.PKDIGABCCONTRATOSX FUNCTION FNDIGABCDIGDATOSPADX
   DESCRIPCION: FUNCION QUE REALIZA ALTAS BAJAS MODIFICACIONES Y CONSULTAS DE LA TABLA DIGWEB.TADGDATOSPAD
   AUTOR: Jesus Nieto Porras
   FECHA CREACION: 10/02/2014
   FECHA ACTUALIZACION
   VERSION: 1.0
   FECHA MODIFICACION:
   NOTAS:
   ************************************************************************************************/
   FUNCTION FNDIGABCDIGDATOSPADX (
      PAFIINOPCION       IN NUMBER,
      PAFIIDREG          IN DIGWEB.TADGDATOSPAD.FIIDREG%TYPE,
      PAFINOPAG          IN DIGWEB.TADGDATOSPAD.FINOPAG%TYPE,
      PAFIEXPIMX         IN DIGWEB.TADGDATOSPAD.FIEXPIMX%TYPE,
      PAFISOLICITUD      IN DIGWEB.TADGDATOSPAD.FISOLICITUD%TYPE,
      PAFCDESCCAMPO      IN DIGWEB.TADGDATOSPAD.FCDESCCAMPO%TYPE,
      PAFCRUTAIMAGEN     IN DIGWEB.TADGDATOSPAD.FCRUTAIMAGEN%TYPE,
      PAFCTEXTO          IN DIGWEB.TADGDATOSPAD.FCTEXTO%TYPE,
      PAFISTATUS         IN DIGWEB.TADGDATOSPAD.FISTATUS%TYPE,
      PAFDFECHAALTA      IN VARCHAR2,
      PAFDMODIFICACION   IN VARCHAR2,
      PAFCUSRMODIFICO    IN DIGWEB.TADGDATOSPAD.FCUSRMODIFICO%TYPE)
      RETURN DIGCURSOR
   IS
      VCursorsalida   DIGCURSOR;

      VFIID           NUMBER := 0;
      VFIERROR        NUMBER := 0;
      VFIRESULT       NUMBER := 0;
      VFCERRORSQL     VARCHAR2 (300);
   BEGIN
      BEGIN
         IF PAFIINOPCION = 1
         THEN
            BEGIN
               SELECT 1
                 INTO VFIRESULT
                 FROM DUAL
                WHERE EXISTS
                         (SELECT FIIDREG
                            FROM DIGWEB.TADGDATOSPAD
                           WHERE     FIIDREG = PAFIIDREG
                                 AND FINOPAG = PAFINOPAG
                                 AND FIEXPIMX = PAFIEXPIMX
                                 AND FISOLICITUD = PAFISOLICITUD
                                 AND FCDESCCAMPO = PAFCDESCCAMPO);

               IF VFIRESULT > 0
               THEN
                  OPEN VCursorsalida FOR
                     SELECT ('El documento ya existe.') MSG FROM DUAL;

                  RETURN VCursorsalida;
               END IF;
            EXCEPTION
               WHEN NO_DATA_FOUND
               THEN
                  INSERT INTO DIGWEB.TADGDATOSPAD (FIIDREG,
                                                   FINOPAG,
                                                   FIEXPIMX,
                                                   FISOLICITUD,
                                                   FCDESCCAMPO,
                                                   FCRUTAIMAGEN,
                                                   FCTEXTO,
                                                   FISTATUS,
                                                   FDFECHAALTA,
                                                   FDMODIFICACION,
                                                   FCUSRMODIFICO)
                       VALUES (PAFIIDREG,
                               PAFINOPAG,
                               PAFIEXPIMX,
                               PAFISOLICITUD,
                               PAFCDESCCAMPO,
                               PAFCRUTAIMAGEN,
                               PAFCTEXTO,
                               PAFISTATUS,
                               TO_DATE (PAFDFECHAALTA),
                               TO_DATE (PAFDMODIFICACION),
                               PAFCUSRMODIFICO);

                  COMMIT;

                  OPEN VCursorsalida FOR
                     SELECT ('Se agrego el documento') MSG FROM DUAL;

                  RETURN VCursorsalida;
            END;
         ELSIF PAFIINOPCION = 2
         THEN
            UPDATE DIGWEB.TADGDATOSPAD
               SET FCRUTAIMAGEN = PAFCRUTAIMAGEN,
                   FCTEXTO = PAFCTEXTO,
                   FISTATUS = PAFISTATUS,
                   FDMODIFICACION = PAFDMODIFICACION
             WHERE     FIIDREG = PAFIIDREG
                   AND FINOPAG = PAFINOPAG
                   AND FIEXPIMX = PAFIEXPIMX
                   AND FISOLICITUD = PAFISOLICITUD
                   AND FCDESCCAMPO = PAFCDESCCAMPO;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se actualizo el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 3
         THEN
            DELETE DIGWEB.TADGDATOSPAD
             WHERE     FIIDREG = PAFIIDREG
                   AND FINOPAG = PAFINOPAG
                   AND FIEXPIMX = PAFIEXPIMX
                   AND FISOLICITUD = PAFISOLICITUD
                   AND FCDESCCAMPO = PAFCDESCCAMPO;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se elimino el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 4
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FINOPAG,
                        FIEXPIMX,
                        FISOLICITUD,
                        FCDESCCAMPO,
                        FCRUTAIMAGEN,
                        FCTEXTO,
                        FISTATUS,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TADGDATOSPAD
                  WHERE     FIIDREG = PAFIIDREG
                        AND FINOPAG = PAFINOPAG
                        AND FIEXPIMX = PAFIEXPIMX
                        AND FISOLICITUD = PAFISOLICITUD
                        AND FCDESCCAMPO = PAFCDESCCAMPO
               ORDER BY FIIDREG, FINOPAG;

            RETURN VCursorsalida;
         ELSIF PAFIINOPCION = 5
         THEN
            OPEN VCursorsalida FOR
                 SELECT FIIDREG,
                        FINOPAG,
                        FIEXPIMX,
                        FISOLICITUD,
                        FCDESCCAMPO,
                        FCRUTAIMAGEN,
                        FCTEXTO,
                        FISTATUS,
                        FDFECHAALTA,
                        FDMODIFICACION,
                        FCUSRMODIFICO
                   FROM DIGWEB.TADGDATOSPAD
                  WHERE     FIEXPIMX = PAFIEXPIMX
                        AND FISOLICITUD = PAFISOLICITUD
                        AND FCDESCCAMPO = PAFCDESCCAMPO
               ORDER BY FIIDREG, FINOPAG;

            RETURN VCursorsalida;
         --Cambiar Estatus Solicitud
         ELSIF PAFIINOPCION = 6
         THEN
            UPDATE DIGWEB.TADGDATOSPAD
               SET FISTATUS = PAFISTATUS, FDMODIFICACION = PAFDMODIFICACION
             WHERE FISOLICITUD = PAFISOLICITUD AND FISTATUS = 0;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se actualizo el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         --Recuperar DatosaProcesar1
         ELSIF PAFIINOPCION = 7
         THEN
            OPEN VCursorsalida FOR
                 SELECT DISTINCT (fisolicitud), 'OK' AS MSG
                   FROM DIGWEB.TADGDATOSPAD
                  WHERE fistatus = PAFISTATUS
               ORDER BY FISOLICITUD ASC;

            RETURN VCursorsalida;
         --Recuperar DatosaProcesar3
         ELSIF PAFIINOPCION = 8
         THEN
            OPEN VCursorsalida FOR
                 SELECT T1.FIIDREG,
                        T1.FINOPAG,
                        T1.FCRUTAIMAGEN,
                        T2.FCDESCCAMPO,
                        T2.FCCORDIMAGEN,
                        T2.FCCORDTEXTO,
                        T3.FIEXPIMX,
                        T3.FISOLICITUD,
                        T3.FCRUTAIMAGEN,
                        T3.FCTEXTO,
                        T3.FISTATUS,
                        'OK' AS MSG
                   FROM DIGWEB.TCCATDETCONTRATOS T1,
                        DIGWEB.TCCATCORDENADAS T2,
                        DIGWEB.TADGDATOSPAD T3
                  WHERE     T1.FIIDREG = T2.FIIDREG
                        AND T1.FINOPAG = T2.FINOPAG
                        AND T1.FIIDREG = T3.FIIDREG
                        AND T1.FINOPAG = T3.FINOPAG
                        AND T2.FCDESCCAMPO = T3.FCDESCCAMPO
                        AND T3.FISTATUS = 1
                        AND T3.FISOLICITUD = PAFISOLICITUD
               ORDER BY T1.FIIDREG ASC, T1.FINOPAG ASC, T3.FCRUTAIMAGEN DESC;

            RETURN VCursorsalida;
         --Cambiar Estatus Solicitud
         ELSIF PAFIINOPCION = 9
         THEN
            UPDATE DIGWEB.TADGDATOSPAD
               SET FISTATUS = PAFISTATUS, FDMODIFICACION = PAFDMODIFICACION
             WHERE FISOLICITUD = PAFISOLICITUD AND FISTATUS = 1;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se actualizo el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         --Recuperar FiltrarDatosaProcesar1
         ELSIF PAFIINOPCION = 10
         THEN
            OPEN VCursorsalida FOR
                 SELECT DISTINCT (fiidreg), 'OK' AS MSG
                   FROM DIGWEB.TADGDATOSPAD
                  WHERE fistatus = PAFISTATUS AND fisolicitud = PAFISOLICITUD
               ORDER BY fiidreg ASC;

            RETURN VCursorsalida;
         --Recuperar recuperaDatosIndexar
         ELSIF PAFIINOPCION = 11
         THEN
            OPEN VCursorsalida FOR
                 SELECT T1.FIIDREG,
                        T1.FINOPAG,
                        T1.FCRUTAIMAGEN,
                        T2.FCDESCCAMPO,
                        T2.FCCORDIMAGEN,
                        T2.FCCORDTEXTO,
                        T3.FIEXPIMX,
                        T3.FISOLICITUD,
                        T3.FCRUTAIMAGEN,
                        T3.FCTEXTO,
                        T3.FISTATUS,
                        'OK' AS MSG
                   FROM DIGWEB.TCCATDETCONTRATOS T1,
                        DIGWEB.TCCATCORDENADAS T2,
                        DIGWEB.TADGDATOSPAD T3
                  WHERE     T1.FIIDREG = T2.FIIDREG
                        AND T1.FINOPAG = T2.FINOPAG
                        AND T1.FIIDREG = T3.FIIDREG
                        AND T1.FINOPAG = T3.FINOPAG
                        AND T2.FCDESCCAMPO = T3.FCDESCCAMPO
                        AND T3.FISTATUS = PAFISTATUS
                        AND T3.FISOLICITUD = PAFISOLICITUD
                        AND T1.FINOPAG = 0
               ORDER BY T1.FIIDREG ASC, T1.FINOPAG ASC, T3.FCRUTAIMAGEN DESC;

            RETURN VCursorsalida;
         --Cambiar Estatus Solicitud//Asigna 3
         ELSIF PAFIINOPCION = 12
         THEN
            UPDATE DIGWEB.TADGDATOSPAD
               SET FISTATUS = PAFISTATUS, FDMODIFICACION = PAFDMODIFICACION
             WHERE FISOLICITUD = PAFISOLICITUD AND FISTATUS = 2;

            COMMIT;

            OPEN VCursorsalida FOR
               SELECT ('Se actualizo el documento') MSG FROM DUAL;

            RETURN VCursorsalida;
         END IF;
      EXCEPTION
         WHEN OTHERS
         THEN
            BEGIN
               VFIERROR := 1;
               VFCERRORSQL := SQLERRM;
            END;
      END;

      IF VFIERROR = 1
      THEN
         ROLLBACK;

         OPEN VCursorsalida FOR
            SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG
              FROM DUAL;

         RETURN VCursorsalida;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         VFCERRORSQL := SQLERRM;

         OPEN VCursorsalida FOR
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL;

         RETURN VCursorsalida;
   END;
END PKDIGABCCONTRATOSX;
/


--
-- PQDGMANTODOCS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGMANTODOCS
AS
   PROCEDURE SPCATCONTRAMANTO (
      PAOPCION          IN     INTEGER,
      PAIDREG           IN     DIGWEB.TCCATCONTRATOS.FIIDREG%TYPE,
      PAPRODUCTO        IN     DIGWEB.TCCATCONTRATOS.FCPRODUCTO%TYPE,
      PAIDCONTRATO      IN     DIGWEB.TCCATCONTRATOS.FIIDCONTRATO%TYPE,
      PAFCIDCONTRATO    IN     DIGWEB.TCCATCONTRATOS.FCIDCONTRATO%TYPE,
      PALLAVECONTRATO   IN     DIGWEB.TCCATCONTRATOS.FCLLAVECONTRATO%TYPE,
      PAUSRMODIFICO     IN     DIGWEB.TCCATCONTRATOS.FCUSRMODIFICO%TYPE,
      PACODERROR           OUT INTEGER,
      PADESCERROR          OUT VARCHAR2)
   IS
   BEGIN
      IF PAOPCION = 1
      THEN
         INSERT INTO DIGWEB.TCCATCONTRATOS (FIIDREG,
                                            FCPRODUCTO,
                                            FIIDCONTRATO,
                                            FCIDCONTRATO,
                                            FCLLAVECONTRATO,
                                            FDFECHAALTA,
                                            FDMODIFICACION,
                                            FCUSRMODIFICO)
              VALUES (PAIDREG,
                      PAPRODUCTO,
                      PAIDCONTRATO,
                      PAFCIDCONTRATO,
                      PALLAVECONTRATO,
                      SYSDATE,
                      SYSDATE,
                      PAUSRMODIFICO);

         PACODERROR := 0;
         PADESCERROR := 'SE INSERTO CORRECTAMENTE LA INFO';
         COMMIT;
      ELSIF PAOPCION = 2
      THEN
         DELETE FROM DIGWEB.TCCATCONTRATOS
               WHERE     FIIDREG = PAIDREG
                     AND FCPRODUCTO = PAPRODUCTO
                     AND FIIDCONTRATO = PAIDCONTRATO
                     AND FCIDCONTRATO = PAFCIDCONTRATO;

         PACODERROR := 0;
         PADESCERROR := 'SE BORRO CORRECTAMENTE LA INFO';
         COMMIT;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;

         BEGIN
            PACODERROR := SQLERRM;
            PADESCERROR :=
               'ERROR EN PROCEDIMIENTO->[DIGWEB.PQDGMANTODOCS.SPCATCONTRAMANTO] '
               || SQLCODE
               || ' - '
               || SQLERRM;
         END;
   END SPCATCONTRAMANTO;

   PROCEDURE SPCATCORDENADA (
      PAOPCION        IN     INTEGER,
      PAIDREG         IN     DIGWEB.TCCATCORDENADAS.FIIDREG%TYPE,
      PANOPAG         IN     DIGWEB.TCCATCORDENADAS.FINOPAG%TYPE,
      PADESCCAMPO     IN     DIGWEB.TCCATCORDENADAS.FCDESCCAMPO%TYPE,
      PACORDIMAGEN    IN     DIGWEB.TCCATCORDENADAS.FCCORDIMAGEN%TYPE,
      PACORDTEXTO     IN     DIGWEB.TCCATCORDENADAS.FCCORDTEXTO%TYPE,
      PAUSRMODIFICO   IN     DIGWEB.TCCATCORDENADAS.FCUSRMODIFICO%TYPE,
      PACODERROR         OUT INTEGER,
      PADESCERROR        OUT VARCHAR2)
   IS
   BEGIN
      IF PAOPCION = 1
      THEN
         INSERT INTO DIGWEB.TCCATCORDENADAS (FIIDREG,
                                             FINOPAG,
                                             FCDESCCAMPO,
                                             FCCORDIMAGEN,
                                             FCCORDTEXTO,
                                             FDFECHAALTA,
                                             FDMODIFICACION,
                                             FCUSRMODIFICO)
              VALUES (PAIDREG,
                      PANOPAG,
                      PADESCCAMPO,
                      PACORDIMAGEN,
                      PACORDTEXTO,
                      SYSDATE,
                      SYSDATE,
                      PAUSRMODIFICO);

         PACODERROR := 0;
         PADESCERROR := 'SE INSERTO CORRECTAMENTE LA INFO';
         COMMIT;
      ELSIF PAOPCION = 2
      THEN
         DELETE FROM DIGWEB.TCCATCORDENADAS
               WHERE     FIIDREG = PAIDREG
                     AND FINOPAG = PANOPAG
                     AND FCDESCCAMPO = PADESCCAMPO;

         PACODERROR := 0;
         PADESCERROR := 'SE BORRO CORRECTAMENTE LA INFO';
         COMMIT;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;

         BEGIN
            PACODERROR := SQLERRM;
            PADESCERROR :=
               'ERROR EN PROCEDIMIENTO->[DIGWEB.PQDGMANTODOCS.SPCATCORDENADA] '
               || SQLCODE
               || ' - '
               || SQLERRM;
         END;
   END SPCATCORDENADA;



   PROCEDURE SPCATDETCONTRA (
      PAOPCION        IN     INTEGER,
      PAIDREG         IN     DIGWEB.TCCATDETCONTRATOS.FIIDREG%TYPE,
      PANOPAG         IN     DIGWEB.TCCATDETCONTRATOS.FINOPAG%TYPE,
      PARUTAIMAGEN    IN     DIGWEB.TCCATDETCONTRATOS.FCRUTAIMAGEN%TYPE,
      PADESC          IN     DIGWEB.TCCATDETCONTRATOS.FCDESC%TYPE,
      PAUSRMODIFICO   IN     DIGWEB.TCCATDETCONTRATOS.FCUSRMODIFICO%TYPE,
      PACODERROR         OUT INTEGER,
      PADESCERROR        OUT VARCHAR2)
   IS
   BEGIN
      IF PAOPCION = 1
      THEN
         INSERT INTO DIGWEB.TCCATDETCONTRATOS (FIIDREG,
                                               FINOPAG,
                                               FCRUTAIMAGEN,
                                               FCDESC,
                                               FDFECHAALTA,
                                               FDMODIFICACION,
                                               FCUSRMODIFICO)
              VALUES (PAIDREG,
                      PANOPAG,
                      PARUTAIMAGEN,
                      PADESC,
                      SYSDATE,
                      SYSDATE,
                      PAUSRMODIFICO);

         PACODERROR := 0;
         PADESCERROR := 'SE INSERTO CORRECTAMENTE LA INFO';
         COMMIT;
      ELSIF PAOPCION = 2
      THEN
         DELETE FROM DIGWEB.TCCATDETCONTRATOS
               WHERE     FIIDREG = PAIDREG
                     AND FINOPAG = FINOPAG
                     AND FCRUTAIMAGEN = PARUTAIMAGEN;

         PACODERROR := 0;
         PADESCERROR := 'SE BORRO CORRECTAMENTE LA INFO';
         COMMIT;
      END IF;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;

         BEGIN
            PACODERROR := SQLERRM;
            PADESCERROR :=
               'ERROR EN PROCEDIMIENTO->[DIGWEB.PQDGMANTODOCS.SPCATCORDENADA] '
               || SQLCODE
               || ' - '
               || SQLERRM;
         END;
   END SPCATDETCONTRA;
END PQDGMANTODOCS;
/


--
-- PQDGTGETRUTAS  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGTGETRUTAS AS


FUNCTION FNDGSGETEXPIMX    (paAPPIMX     IN     DIGWEB.IMX01.APPIMX%TYPE,
                            paIMX01      IN     DIGWEB.IMX01.IMX01%TYPE )         
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);
BEGIN 
      OPEN VCURSORSALIDA FOR    
         SELECT EXPIMX , 'OK' as MSG
         FROM DIGWEB.IMX01
         WHERE APPIMX= paAPPIMX
         AND IMX01=paIMX01;
      RETURN VCURSORSALIDA;  
EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



FUNCTION FNDGSGETRUTAS    (paAPPIMX         IN     DIGWEB.IMX01.APPIMX%TYPE       ,
                           paEXPIMX         IN     DIGWEB.IMX01.EXPIMX%TYPE       ,
                           paFIETAPA        IN     DIGWEB.IMX02.FIETAPA%TYPE      ,
                           paFISUBPRODUCTO  IN     DIGWEB.IMX02.FISUBPRODUCTO%TYPE,
                           paSTATUSIMX      IN     DIGWEB.IMX02.STATUSIMX%TYPE    )         
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 

      OPEN VCURSORSALIDA FOR          
        SELECT  X2.NOMDOCIMX, XD.FIIDDOCUMENTO as IDDOCTO, X3.PAGIMX AS IDPAG, X3.RUTIMX AS RUTA, 'OK' AS MSG                       
        FROM DIGWEB.IMX03 X3 INNER JOIN DIGWEB.IMX02 X2 
        ON X3.APPIMX = X2.APPIMX  AND X3.EXPIMX = X2.EXPIMX AND X3.DOCIMX = X2.DOCIMX 
        AND X3.FISUBPRODUCTO = X2.FISUBPRODUCTO  AND X3.FIETAPA = X2.FIETAPA           
        INNER JOIN DIGWEB.IMX01 X
        ON X.APPIMX = X2.APPIMX AND X.EXPIMX = X2.EXPIMX  
        INNER JOIN DIGWEB.CATDESCDOCUMENTOS  XD 
        ON X2.IDDOCIMX  =XD.FIIDDOCUMENTO AND  X2.NOMDOCIMX= XD.FCDESCDOCUMENTO                 
        WHERE X.APPIMX = paAPPIMX
        AND X.EXPIMX= paEXPIMX 
        AND X2.FIETAPA=paFIETAPA
        AND X2.FISUBPRODUCTO=paFISUBPRODUCTO
        AND X2.STATUSIMX =paSTATUSIMX
        AND X3.STATUSIMX =paSTATUSIMX  
        ORDER BY   XD.FIIDDOCUMENTO, X3.PAGIMX;                  
      RETURN VCURSORSALIDA;  

EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;


FUNCTION FNDGSGETEXPIMXWS  (paAPPIMX     IN     DIGWEB.IMX01.APPIMX%TYPE   ,
                            paIMX01      IN     DIGWEB.IMX01.IMX01%TYPE    ,
                            paIdDocimx   IN     DIGWEB.IMX02.IDDOCIMX%TYPE )         
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);
BEGIN 
      OPEN VCURSORSALIDA FOR    
         SELECT A.EXPIMX , B.DOCIMX
         FROM DIGWEB.IMX01 A INNER JOIN DIGWEB.IMX02 B
         ON (A.APPIMX = B.APPIMX AND A.EXPIMX= B.EXPIMX)
         WHERE a.APPIMX= paAPPIMX
         AND A.IMX01=paIMX01
         AND B.IDDOCIMX=paIdDocimx ;
      RETURN VCURSORSALIDA;  
EXCEPTION 
   WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;

FUNCTION FNDGUACTPAG(paAppimx        IN DIGWEB.IMX03.APPIMX%TYPE       ,
                     paExpimx        IN DIGWEB.IMX03.EXPIMX%TYPE       , 
                     paDocumento     IN DIGWEB.IMX03.DOCIMX%TYPE       , 
                     paPagina        IN DIGWEB.IMX03.PAGIMX%TYPE       ,
                     paSubproducto   IN DIGWEB.IMX03.FISUBPRODUCTO%TYPE,
                     paEtapa         IN DIGWEB.IMX03.FIETAPA%TYPE      ,
                     paStatus        IN DIGWEB.IMX03.STATUSIMX%TYPE    )      
RETURN DIGCURSOR
IS

VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);

BEGIN 
        UPDATE DIGWEB.IMX03
        SET  STATUSIMX=paStatus
        WHERE APPIMX=paAppimx  AND EXPIMX=paExpimx  AND  DOCIMX=paDocumento  AND  PAGIMX=paPagina  AND FISUBPRODUCTO=paSubproducto   AND FIETAPA=paEtapa ;
        COMMIT;
       
        OPEN VCURSORSALIDA FOR 
          SELECT ('Actualizado!') MSG FROM DUAL;
        RETURN VCURSORSALIDA;   
EXCEPTION 
   WHEN OTHERS THEN  
        ROLLBACK;       
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;
 
END PQDGTGETRUTAS;
/


--
-- PQDGDOCTOSWI  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGDOCTOSWI AS


FUNCTION  FNDGSGETDOCIMX(   paAPPIMX        IN DIGWEB.IMX02.APPIMX%TYPE,
                            paEXPIMX        IN DIGWEB.IMX02.EXPIMX%TYPE,
                            paSTATUSIMX      IN DIGWEB.IMX02.STATUSIMX%TYPE)
RETURN DIGCURSOR
IS
VCURSORSALIDA DIGCURSOR;
BEGIN
        OPEN VCursorsalida FOR 
            SELECT DISTINCT CATDOCIMAX.FIIDIMAX AS ID_TIPO_DOCTO, CATDOCIMAX.FCDESCDOCUMENTO AS NOMBRE_DOCUMENTO
            FROM DIGWEB.CATDOCIMAX, DIGWEB.IMX02
            WHERE IMX02.APPIMX=paAPPIMX 
            AND IMX02.EXPIMX=paEXPIMX 
            AND IMX02.STATUSIMX=paSTATUSIMX
            AND TRIM(IMX02.APPIMX)=CATDOCIMAX.FCPRODUCTO
            AND IMX02.IDDOCIMX = CATDOCIMAX.FIIDDIGWEB 
            ORDER BY FIIDIMAX, FCDESCDOCUMENTO;
        RETURN VCursorsalida; 

END;


FUNCTION FNDGUCATDESCDOC               (PAFIIDDOCUMENTO        IN DIGWEB.CATDESCDOCUMENTOS.FIIDDOCUMENTO%TYPE,
                                        PAFCDESCDOCUMENTO      IN DIGWEB.CATDESCDOCUMENTOS.FCDESCDOCUMENTO%TYPE)

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

        UPDATE DIGWEB.CATDESCDOCUMENTOS SET FCDESCDOCUMENTO=PAFCDESCDOCUMENTO WHERE FIIDDOCUMENTO=PAFIIDDOCUMENTO;
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo la Descripcion del docto') MSG FROM DUAL; 
            RETURN VCursorsalida;    
        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 


FUNCTION FNDGUCATDOCTO               (PAFIOPEDOCUMENTO        IN DIGWEB.CATDOCUMENTOS.FIOPEDOCUMENTO%TYPE,
                                      PAFIIDDOCUMENTO        IN DIGWEB.CATDOCUMENTOS.FIIDDOCUMENTO%TYPE,
                                      PAFCDESCDOCUMENTO      IN DIGWEB.CATDOCUMENTOS.FCDESCDOCUMENTO%TYPE)

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

        UPDATE DIGWEB.CATDOCUMENTOS SET FCDESCDOCUMENTO=PAFCDESCDOCUMENTO WHERE FIOPEDOCUMENTO=PAFIOPEDOCUMENTO AND FIIDDOCUMENTO=PAFIIDDOCUMENTO;
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo la Descripcion del docto') MSG FROM DUAL; 
            RETURN VCursorsalida;    
        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 


END PQDGDOCTOSWI;
/


--
-- PQDGVISORWEB  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGVISORWEB AS
/*********************************************************************************************** 
 
NAME: IDIGWEB.PQDGVISORWEB
DESCRIPCION: PACKAGE DE FUNCIONES Y STORES QUE SE UTILIZAN EL VISOR DE DOCUMENTOS DEL ESQUEMA
             DIGWEB, SE AGREGARON OPCIONES
AUTOR: ARMANDO OSORIO HERNANDEZ 
FECHA CREACION: 26/01/2012 
FECHA ACTUALIZACION  
VERSION: 1.0
FECHA MODIFICACION: 
NOTAS: 
************************************************************************************************/

FUNCTION FNDGSVISORWEB                      (PAFIOPCION         IN          NUMBER                                  ,
                                             PAFCAPPIMX         IN          DIGWEB.IMX01.APPIMX%TYPE                ,
                                             PAFCIMX01          IN          DIGWEB.IMX01.IMX01%TYPE                 ,
                                             PAFIEXPIMX         IN          DIGWEB.IMX01.EXPIMX%TYPE                ,
                                             PAFISUBPRODUCTO    IN          DIGWEB.IMX02.FISUBPRODUCTO%TYPE         ,
                                             PAFIETAPA          IN          DIGWEB.IMX02.FIETAPA%TYPE               ,
                                             PAFISTATUSIMX2     IN          DIGWEB.IMX02.STATUSIMX%TYPE             ,
                                             PAFISTATUSIMX3     IN          DIGWEB.IMX03.STATUSIMX%TYPE             ,
                                             PAFIDOCIMX         IN          DIGWEB.IMX02.DOCIMX%TYPE                ,
                                             PAFIIDDOCIMX       IN          DIGWEB.IMX02.IDDOCIMX%TYPE              ,
                                             PAFCSVRHTTP        IN          VARCHAR2                                ,
                                             PAFCARPETABASE     IN          VARCHAR2                                ,
                                             PAFCCARPETAWEB     IN          VARCHAR2)          
RETURN DIGCURSOR

IS

VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(300);
VFCSEPARADOR    VARCHAR2(1):='/';

BEGIN 

    IF PAFIOPCION = 1 THEN        
                
        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01   
                  AND X2.STATUSIMX = PAFISTATUSIMX2
                  AND X3.STATUSIMX = PAFISTATUSIMX3
                  AND X2.FISUBPRODUCTO = PAFISUBPRODUCTO
                  AND X2.FIETAPA = PAFIETAPA                       
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA; 
             
    ELSIF PAFIOPCION = 2 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01                  
                  AND X2.FISUBPRODUCTO = PAFISUBPRODUCTO
                  AND X2.FIETAPA = PAFIETAPA                       
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;         
        
    ELSIF PAFIOPCION = 3 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01   
                  AND X2.STATUSIMX = PAFISTATUSIMX2
                  AND X3.STATUSIMX = PAFISTATUSIMX3                    
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;           
            
    ELSIF PAFIOPCION = 4 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01                      
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;
        
    ELSIF PAFIOPCION = 5 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT EXPIMX,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,IMX11,IMX12,IMX13,IMX14,
                   IMX15,IMX16,IMX17,IMX18,IMX19,IMX20,FCCLIENTEUNICO,FDALTA,FDMODIFICACION
            FROM DIGWEB.IMX01
            WHERE APPIMX = PAFCAPPIMX
              AND IMX01 = PAFCIMX01;
        
        RETURN VCURSORSALIDA;

    ELSIF PAFIOPCION = 6 THEN
    
        OPEN VCURSORSALIDA FOR
        
            SELECT APPIMX,EXPIMX,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,IMX11,IMX12,IMX13,
                   IMX14,IMX15,IMX16,IMX17,IMX18,IMX19,IMX20,FCCLIENTEUNICO,FDALTA,FDMODIFICACION
            FROM DIGWEB.IMX01
            WHERE IMX01 = PAFCIMX01;
        
        RETURN VCURSORSALIDA;         
        
    ELSIF PAFIOPCION = 7 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAFIEXPIMX
            ORDER BY FISUBPRODUCTO,FIETAPA,IDDOCIMX;
        
        RETURN VCURSORSALIDA;                       

    ELSIF PAFIOPCION = 8 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAFIEXPIMX
              AND STATUSIMX = PAFISTATUSIMX2
            ORDER BY FISUBPRODUCTO,FIETAPA,IDDOCIMX;
        
        RETURN VCURSORSALIDA;
        
    ELSIF PAFIOPCION = 9 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAFIEXPIMX
              AND FISUBPRODUCTO = PAFISUBPRODUCTO
              AND FIETAPA = PAFIETAPA
              AND STATUSIMX = PAFISTATUSIMX2
            ORDER BY FISUBPRODUCTO,FIETAPA,IDDOCIMX;
        
        RETURN VCURSORSALIDA;        

    ELSIF PAFIOPCION = 10 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAFIEXPIMX
              AND FISUBPRODUCTO = PAFISUBPRODUCTO
              AND FIETAPA = PAFIETAPA
            ORDER BY FISUBPRODUCTO,FIETAPA,IDDOCIMX;
        
        RETURN VCURSORSALIDA;    
        
    ELSIF PAFIOPCION = 11 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAFIEXPIMX
              AND FISUBPRODUCTO = PAFISUBPRODUCTO
              AND FIETAPA = PAFIETAPA
              AND IDDOCIMX = PAFIIDDOCIMX
            ORDER BY FISUBPRODUCTO,FIETAPA,IDDOCIMX;
        
        RETURN VCURSORSALIDA;   
        
    ELSIF PAFIOPCION = 12 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAFIEXPIMX
              AND IDDOCIMX = PAFIIDDOCIMX
              AND STATUSIMX = PAFISTATUSIMX2
            ORDER BY FISUBPRODUCTO,FIETAPA,IDDOCIMX;
        
        RETURN VCURSORSALIDA;   
        
    ELSIF PAFIOPCION = 13 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT DOCIMX,IDDOCIMX,NOMDOCIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA
            FROM DIGWEB.IMX02
            WHERE APPIMX = PAFCAPPIMX
              AND EXPIMX = PAFIEXPIMX
              AND IDDOCIMX = PAFIIDDOCIMX
            ORDER BY FISUBPRODUCTO,FIETAPA,IDDOCIMX;
        
        RETURN VCURSORSALIDA;                           
                
    ELSIF PAFIOPCION = 14 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT T.DOCIMX,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX,T.FISUBPRODUCTO,T.FIETAPA,T.USUARIOIMX,T.WSIMX,T.FECDICIMX,
                  (PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG) FCRUTAHTML
            FROM(       
                SELECT DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(RUTIMX,1,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
                           END
                       )FCRUTAIMG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = PAFIEXPIMX
                )T
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY T.FISUBPRODUCTO,T.FIETAPA,T.DOCIMX,T.PAGIMX;
                
        RETURN VCURSORSALIDA;  
        
    ELSIF PAFIOPCION = 15 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT T.DOCIMX,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX,T.FISUBPRODUCTO,T.FIETAPA,T.USUARIOIMX,T.WSIMX,T.FECDICIMX,
                  (PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG) FCRUTAHTML
            FROM(       
                SELECT DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(RUTIMX,1,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
                           END
                       )FCRUTAIMG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = PAFIEXPIMX
                  AND DOCIMX = PAFIDOCIMX
                )T
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY T.FISUBPRODUCTO,T.FIETAPA,T.DOCIMX,T.PAGIMX;
                
        RETURN VCURSORSALIDA;    
        
    ELSIF PAFIOPCION = 16 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT T.DOCIMX,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX,T.FISUBPRODUCTO,T.FIETAPA,T.USUARIOIMX,T.WSIMX,T.FECDICIMX,
                  (PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG) FCRUTAHTML
            FROM(       
                SELECT DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(RUTIMX,1,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
                           END
                       )FCRUTAIMG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = PAFIEXPIMX
                  AND DOCIMX = PAFIDOCIMX
                  AND STATUSIMX = PAFISTATUSIMX3
                )T
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY T.FISUBPRODUCTO,T.FIETAPA,T.DOCIMX,T.PAGIMX;            
            
            RETURN VCURSORSALIDA;

    ELSIF PAFIOPCION = 17 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT T.DOCIMX,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX,T.FISUBPRODUCTO,T.FIETAPA,T.USUARIOIMX,T.WSIMX,T.FECDICIMX,
                  (PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG) FCRUTAHTML
            FROM(       
                SELECT DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(RUTIMX,1,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
                           END
                       )FCRUTAIMG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = PAFIEXPIMX
                  AND DOCIMX = PAFIDOCIMX
                  AND FISUBPRODUCTO = PAFISUBPRODUCTO
                  AND FIETAPA = PAFIETAPA
                  AND STATUSIMX = PAFISTATUSIMX2
                )T
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY T.FISUBPRODUCTO,T.FIETAPA,T.DOCIMX,T.PAGIMX;
                
        RETURN VCURSORSALIDA;                  
        
    ELSIF PAFIOPCION = 18 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT T.DOCIMX,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX,T.FISUBPRODUCTO,T.FIETAPA,T.USUARIOIMX,T.WSIMX,T.FECDICIMX,
                  (PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG) FCRUTAHTML
            FROM(       
                SELECT DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(RUTIMX,1,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
                           END
                       )FCRUTAIMG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = PAFIEXPIMX
                  AND DOCIMX = PAFIDOCIMX
                  AND FISUBPRODUCTO = PAFISUBPRODUCTO
                  AND FIETAPA = PAFIETAPA              
                )T
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY T.FISUBPRODUCTO,T.FIETAPA,T.DOCIMX,T.PAGIMX;
                
        RETURN VCURSORSALIDA;                      

    ELSIF PAFIOPCION = 19 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT T.DOCIMX,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX,T.FISUBPRODUCTO,T.FIETAPA,T.USUARIOIMX,T.WSIMX,T.FECDICIMX,
                  (PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG) FCRUTAHTML
            FROM(       
                SELECT DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(RUTIMX,1,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
                           END
                       )FCRUTAIMG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = PAFIEXPIMX                  
                  AND FISUBPRODUCTO = PAFISUBPRODUCTO
                  AND FIETAPA = PAFIETAPA
                  AND STATUSIMX = PAFISTATUSIMX2
                )T
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY T.FISUBPRODUCTO,T.FIETAPA,T.DOCIMX,T.PAGIMX;
                
        RETURN VCURSORSALIDA;   
        
    ELSIF PAFIOPCION = 20 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT T.DOCIMX,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX,T.FISUBPRODUCTO,T.FIETAPA,T.USUARIOIMX,T.WSIMX,T.FECDICIMX,
                  (PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG) FCRUTAHTML
            FROM(       
                SELECT DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(RUTIMX,1,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
                           END
                       )FCRUTAIMG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = PAFIEXPIMX
                  AND FISUBPRODUCTO = PAFISUBPRODUCTO
                  AND FIETAPA = PAFIETAPA                  
                )T
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY T.FISUBPRODUCTO,T.FIETAPA,T.DOCIMX,T.PAGIMX;
                
        RETURN VCURSORSALIDA;         
        
    ELSIF PAFIOPCION = 21 THEN  

        OPEN VCURSORSALIDA FOR
        
            SELECT T.DOCIMX,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX,T.FISUBPRODUCTO,T.FIETAPA,T.USUARIOIMX,T.WSIMX,T.FECDICIMX,
                  (PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG) FCRUTAHTML
            FROM(       
                SELECT DOCIMX,PAGIMX,IMGIMX,RUTIMX,STATUSIMX,FISUBPRODUCTO,FIETAPA,USUARIOIMX,WSIMX,FECDICIMX,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               ('/RESPALDOS2')
                           ELSE
                               SUBSTR(RUTIMX,1,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(RUTIMX,INSTR(RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
                           END
                       )FCRUTAIMG
                FROM DIGWEB.IMX03
                WHERE APPIMX = PAFCAPPIMX
                  AND EXPIMX = PAFIEXPIMX
                  AND STATUSIMX = PAFISTATUSIMX2
                )T
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY T.FISUBPRODUCTO,T.FIETAPA,T.DOCIMX,T.PAGIMX;
                
        RETURN VCURSORSALIDA;   
        
    ELSIF PAFIOPCION = 22 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01
                  AND X2.STATUSIMX = PAFISTATUSIMX2
                  AND X3.STATUSIMX = PAFISTATUSIMX3
                  AND X2.FISUBPRODUCTO = PAFISUBPRODUCTO                       
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;         
        
    ELSIF PAFIOPCION = 23 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01
                  AND X2.FISUBPRODUCTO = PAFISUBPRODUCTO                       
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA; 
        
 ELSIF PAFIOPCION = 24 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01   
                  AND X3.STATUSIMX = PAFISTATUSIMX3
                  AND X2.FISUBPRODUCTO = PAFISUBPRODUCTO
                  AND X2.FIETAPA = PAFIETAPA                       
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;           
        
    ELSIF PAFIOPCION = 25 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01
                  AND X3.STATUSIMX = PAFISTATUSIMX3
                  AND X2.FISUBPRODUCTO = PAFISUBPRODUCTO                       
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;   
        
      ELSIF PAFIOPCION = 26 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01
                  AND X3.STATUSIMX = PAFISTATUSIMX3                    
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;           
        
      ELSIF PAFIOPCION = 30 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01   
                  AND X2.STATUSIMX <> 0
                  AND X3.STATUSIMX <> 0                    
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;   
        
      ELSIF PAFIOPCION = 31 THEN  

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX01 = PAFCIMX01 
                  AND X2.STATUSIMX between  PAFISTATUSIMX2 and  PAFISTATUSIMX3
                  AND X3.STATUSIMX between  PAFISTATUSIMX2 and  PAFISTATUSIMX3                    
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;   
 
/* JNP-I 13AGO2013 */ 

      ELSIF PAFIOPCION = 32 THEN  
      

        OPEN VCURSORSALIDA FOR 
            
            SELECT T.EXPIMX,T.IMX02,T.IMX03,T.IMX04,T.IMX05,T.IMX06,T.IMX07,T.IMX08,T.IMX09,T.IMX10,T.IMX11,
                   T.IMX12,T.IMX13,T.IMX14,T.IMX15,T.IMX16,T.IMX17,T.IMX18,T.IMX19,T.IMX20,T.FCCLIENTEUNICO,
                   T.FDALTA,T.FDMODIFICACION,T.DOCIMX,T.IDDOCIMX,T.NOMDOCIMX,T.STATUSIMX2,T.FISUBPRODUCTOX2,
                   T.FIETAPAX2,T.PAGIMX,T.IMGIMX,T.RUTIMX,T.STATUSIMX3,T.FISUBPRODUCTOX3,T.FIETAPAX3,
                   T.USUARIOIMX,T.WSIMX,T.FECDICIMX,(PAFCSVRHTTP || V.FCALIAS || T.FCRUTAIMG)FCRUTAHTML,
                   'OK' AS MSG
            FROM
            (
                SELECT X.EXPIMX,X.IMX02,X.IMX03,X.IMX04,X.IMX05,X.IMX06,X.IMX07,X.IMX08,X.IMX09,X.IMX10,
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
                               SUBSTR(X3.RUTIMX,1,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1)-1)
                           END
                       )FCSHARED,
                       (
                           CASE WHEN INSTR(X3.RUTIMX,'RESPALDOS2',1) > 0 THEN
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR)-1)
                           ELSE
                               SUBSTR(X3.RUTIMX,INSTR(X3.RUTIMX,VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR || PAFCCARPETAWEB || VFCSEPARADOR,1) + LENGTH(VFCSEPARADOR || PAFCARPETABASE || VFCSEPARADOR)-1)
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
                WHERE X.APPIMX = PAFCAPPIMX
                  AND X.IMX03  = SUBSTR(PAFCIMX01,1,INSTR(PAFCIMX01,'-')-1)
                  AND X.IMX08  = SUBSTR(PAFCIMX01,INSTR(PAFCIMX01,'-')+1,LENGTH(PAFCIMX01))
                  AND X2.STATUSIMX BETWEEN  PAFISTATUSIMX2 AND  PAFISTATUSIMX3
                  AND X3.STATUSIMX BETWEEN  PAFISTATUSIMX2 AND  PAFISTATUSIMX3
            ) T    
            INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON V.FCRUTASOL = T.FCSHARED
            ORDER BY FISUBPRODUCTOX2,FIETAPAX2,IDDOCIMX,PAGIMX;
               
        RETURN VCURSORSALIDA;

     /* JNP-F 13AGO2013 */

    END IF; 

EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA; 
END;         

END PQDGVISORWEB;
/


--
-- PQDGBITACORACHEQUEMOVIL  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGBITACORACHEQUEMOVIL AS






/*
BORRA un nuevo registro en la Bitacora
*/
FUNCTION FNDGDCHQMOVIL(paFCSerial           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCSERIAL%TYPE)        
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);
VGSERIAL        NUMBER:=0; 

BEGIN 
    
    DELETE FROM DIGWEB.TADGBITACORACHEQUEMOVIL WHERE FCSERIAL=paFCSerial;
    COMMIT;
       
    OPEN VCURSORSALIDA FOR 
        SELECT ('Borrado') MSG FROM DUAL;
    RETURN VCURSORSALIDA; 

EXCEPTION 
   WHEN OTHERS THEN  
        ROLLBACK;
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;










/*
Inserta un nuevo registro en la Bitacora
*/
FUNCTION FNDGINSERTCHQMOVIL(paFCProducto         IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCProducto%TYPE     ,
                            paFCBandaChq         IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCBandaChq%TYPE     ,
                            paFCTipoCheque       IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCTipoCheque%TYPE   ,
                            paFCIdDocumento      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCIdDocumento%TYPE  ,
                            paFCPais             IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCPais%TYPE         ,
                            paFCCanal            IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCCanal%TYPE        ,
                            paFCSucursal         IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCSucursal%TYPE     ,
                            paFCOpcionChq        IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCOpcionChq%TYPE    ,
                            paFCCuentaCargo      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCCuentaCargo%TYPE  ,
                            paFCCuentaAbono      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCCuentaAbono%TYPE  ,
                            paFCImporte          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCImporte%TYPE      ,
                            paFCNumeroChq        IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCNumeroChq%TYPE    ,
                            paFCFechaOp          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCFechaOp%TYPE      ,
                            paFCDivisa           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCDivisa%TYPE       ,
                            paFCCodigo           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCCodigo%TYPE       ,
                            paFCTipoBfc          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCTipoBfc%TYPE      ,
                            paFCRefPago          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCRefPago%TYPE      ,
                            paFCNumRtc           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCNumRtc%TYPE       ,
                            paFCHoraOp           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCHoraOp%TYPE       ,
                            paFCimx18            IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCimx18%TYPE        ,
                            paFCimx19            IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCimx19%TYPE        ,
                            paFCimx20            IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCimx20%TYPE        ,
                            paFCExtensionImg     IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCExtensionImg%TYPE ,
                            paFCUsuario          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCUsuario%TYPE      ,
                            paFCWorkStation      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCWorkStation%TYPE  ,
                            paFCIdSubproducto    IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCIdSubproducto%TYPE,
                            paFCIdEtapa          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCIdEtapa%TYPE      ,
                            paFCEnviaImagen      IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCEnviaImagen%TYPE  ,
                            paFCEdoImx           IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCEdoImx%TYPE       ,
                            paFCTipoExt          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCTipoExt%TYPE      ,
                            paFCVerifica         IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCVerifica%TYPE     ,
                            paFCMensaje          IN  DIGWEB.TADGBITACORACHEQUEMOVIL.FCMensaje%TYPE      )        
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);
VGSERIAL        NUMBER:=0; 

BEGIN 

    SELECT NVL (MAX(FCSERIAL),0) + 1
    INTO VGSERIAL
    FROM DIGWEB.TADGBITACORACHEQUEMOVIL
    WHERE FCProducto =paFCProducto
    AND   FCBandaChq =paFCBandaChq;

    INSERT INTO DIGWEB.TADGBITACORACHEQUEMOVIL 
    (FCProducto,      FCBandaChq,      FCTipoCheque,  FCIdDocumento,   FCPais,     FCCanal,     FCSucursal,       FCOpcionChq,
     FCCuentaCargo,   FCCuentaAbono,   FCImporte,     FCNumeroChq,     FCFechaOp,  FCDivisa,    FCCodigo,         FCTipoBfc,
     FCRefPago,       FCNumRtc,        FCHoraOp,      FCimx18,         FCimx19,    FCimx20,     FCExtensionImg,   FCUsuario,
     FCWorkStation,   FCIdSubproducto, FCIdEtapa,     FCEnviaImagen,   FCEdoImx,   FCTipoExt,
     FCVerifica,      FCMensaje,       FDALTA   ,     FCSERIAL, FDMODIFICACION
    )
    VALUES
    (paFCProducto,   paFCBandaChq,     paFCTipoCheque,paFCIdDocumento, paFCPais,   paFCCanal,   paFCSucursal,     paFCOpcionChq,
     paFCCuentaCargo,paFCCuentaAbono,  paFCImporte,   paFCNumeroChq,   paFCFechaOp,paFCDivisa,  paFCCodigo,       paFCTipoBfc,
     paFCRefPago,    paFCNumRtc,       paFCHoraOp,    paFCimx18,       paFCimx19,  paFCimx20,   paFCExtensionImg, paFCUsuario,
     paFCWorkStation,paFCIdSubproducto,paFCIdEtapa,   paFCEnviaImagen, paFCEdoImx, paFCTipoExt,
     paFCVerifica,   paFCMensaje,      SYSDATE,       VGSERIAL , SYSDATE
     );


    COMMIT;
       
    OPEN VCURSORSALIDA FOR 
        SELECT ('Se agrego nuevo registro') MSG FROM DUAL;
    RETURN VCURSORSALIDA; 

EXCEPTION 
   WHEN OTHERS THEN  
        ROLLBACK;
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



/*
CONSULTA en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGSQTERMINAL   (paTerminal    IN  DIGWEB.TCDGTERMINALCHQMOVIL.FIIdTerminal%TYPE,
                           paTerminalD   IN  DIGWEB.TCDGTERMINALCHQMOVIL.FIIdTerminal%TYPE)        
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 
    OPEN VCURSORSALIDA FOR 
        SELECT FIIDTERMINAL,FCTERMINAL,FCESTATUS,FDALTA, FDMODIFICACION
        FROM   DIGWEB.TCDGTERMINALCHQMOVIL          
        WHERE  FIIDTERMINAL BETWEEN  paTerminal  and  paTerminalD;  
        
    RETURN VCURSORSALIDA; 
EXCEPTION 
   WHEN OTHERS THEN  
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



/*
BORRA en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGDELTERMINAL   (paFIIdTerminal    IN  DIGWEB.TCDGTERMINALCHQMOVIL.FIIdTerminal%TYPE)        
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

    DELETE FROM DIGWEB.TCDGTERMINALCHQMOVIL WHERE FIIdTerminal=paFIIdTerminal;
    COMMIT;
       
    OPEN VCURSORSALIDA FOR 
        SELECT ('Borra registro') MSG FROM DUAL;
    RETURN VCURSORSALIDA; 

EXCEPTION 
   WHEN OTHERS THEN  
        ROLLBACK;
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;

/*
Inserta en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGINSERTTERMINAL(paFIIdTerminal    IN  DIGWEB.TCDGTERMINALCHQMOVIL.FIIdTerminal%TYPE   ,
                            paFCTerminal      IN  DIGWEB.TCDGTERMINALCHQMOVIL.FCTerminal%TYPE     ,
                            paFCESTATUS       IN  DIGWEB.TCDGTERMINALCHQMOVIL.FCESTATUS%TYPE      )        
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

    INSERT INTO DIGWEB.TCDGTERMINALCHQMOVIL 
    (FIIdTerminal,      FCTerminal,      FCESTATUS,    FDALTA, FDMODIFICACION)
    VALUES
    (paFIIdTerminal   ,paFCTerminal  ,   paFCESTATUS ,  SYSDATE, SYSDATE );

    COMMIT;
       
    OPEN VCURSORSALIDA FOR 
        SELECT ('Se agrego nuevo registro') MSG FROM DUAL;
    RETURN VCURSORSALIDA; 

EXCEPTION 
   WHEN OTHERS THEN  
        ROLLBACK;
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;




/*
consultA un nuevo registro en la Bitacora x banda
*/
FUNCTION FNDGSECHQMOVILBN(paBanda      IN   DIGWEB.TADGBITACORACHEQUEMOVIL.FCBANDACHQ%TYPE,
                          paFCProducto IN   DIGWEB.TADGBITACORACHEQUEMOVIL.FCPRODUCTO%TYPE)        
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);
VGSERIAL        NUMBER:=0; 

BEGIN 
       
    OPEN VCURSORSALIDA FOR 
    
      SELECT  FCProducto,  FCSERIAL,    FCBandaChq,      FCTipoCheque,  FCIdDocumento,   FCPais,     FCCanal,     FCSucursal,       FCOpcionChq,
         FCCuentaCargo,   FCCuentaAbono,   FCImporte,     FCNumeroChq,     FCFechaOp,  FCDivisa,    FCCodigo,         FCTipoBfc,
         FCRefPago,       FCNumRtc,        FCHoraOp,      FCimx18,         FCimx19,    FCimx20,     FCExtensionImg,   FCUsuario,
         FCWorkStation,   FCIdSubproducto, FCIdEtapa,     FCEnviaImagen,   FCEdoImx,   FCTipoExt,
         FCVerifica,      FCMensaje,       FDALTA   
      FROM DIGWEB.TADGBITACORACHEQUEMOVIL G
      WHERE G.FCBANDACHQ=paBanda   AND  G.FCPRODUCTO=paFCProducto;                
    RETURN VCURSORSALIDA; 

EXCEPTION 
   WHEN OTHERS THEN  
        ROLLBACK;
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;





/*
consultA un nuevo registro en la Bitacora
*/
FUNCTION FNDGSECHQMOVIL(paFecha           IN  VARCHAR,
                        paFechaDos        IN  VARCHAR)        
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);
VGSERIAL        NUMBER:=0; 

BEGIN 
       
    OPEN VCURSORSALIDA FOR 
    
      SELECT  FCProducto,  FCSERIAL,    FCBandaChq,      FCTipoCheque,  FCIdDocumento,   FCPais,     FCCanal,     FCSucursal,       FCOpcionChq,
         FCCuentaCargo,   FCCuentaAbono,   FCImporte,     FCNumeroChq,     FCFechaOp,  FCDivisa,    FCCodigo,         FCTipoBfc,
         FCRefPago,       FCNumRtc,        FCHoraOp,      FCimx18,         FCimx19,    FCimx20,     FCExtensionImg,   FCUsuario,
         FCWorkStation,   FCIdSubproducto, FCIdEtapa,     FCEnviaImagen,   FCEdoImx,   FCTipoExt,
         FCVerifica,      FCMensaje,       FDALTA   
      FROM DIGWEB.TADGBITACORACHEQUEMOVIL
      WHERE FDALTA BETWEEN TO_DATE(paFecha,'YYYY-MM-DD HH24:MI:SS')
                     AND     TO_DATE(paFechaDos,'YYYY-MM-DD HH24:MI:SS')
                     ORDER BY 1,2,3;                
    RETURN VCURSORSALIDA; 

EXCEPTION 
   WHEN OTHERS THEN  
        ROLLBACK;
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;




/*
*/
FUNCTION FNDGGETBANDA (paLlave    IN   DIGWEB.IMX01.IMX01%TYPE,
                       paProducto IN   DIGWEB.IMX01.APPIMX%TYPE)    
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 
    OPEN VCURSORSALIDA FOR     
        SELECT NVL (MAX (EXPIMX),0) AS MSG
        FROM DIGWEB.IMX01
        WHERE IMX01=paLlave
        AND APPIMX=paProducto;
    RETURN VCURSORSALIDA;

EXCEPTION 
   WHEN OTHERS THEN  
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;




/*
Actualiza en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGGETTERMINAL(STATUS   IN   VARCHAR)        
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);
VGIDOCUPADO     NUMBER:=0; 

BEGIN 
       
    OPEN VCURSORSALIDA FOR     
        SELECT FCTERMINAL AS TERMINAL
        FROM DIGWEB.TCDGTERMINALCHQMOVIL
        WHERE FCESTATUS = STATUS;
    RETURN VCURSORSALIDA;

EXCEPTION 
   WHEN OTHERS THEN 
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) TERMINAL FROM DUAL; 
        RETURN VCURSORSALIDA;
END;


/*
Actualiza en CATDGTERMINALCHQMOVIL
*/
FUNCTION FNDGLIBERATERMINAL  (paFCTERMINAL         IN  DIGWEB.TCDGTERMINALCHQMOVIL.FCTERMINAL%TYPE  ) 
RETURN DIGCURSOR
IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);
VGIDOCUPADO     NUMBER:=0; 

BEGIN 
    UPDATE DIGWEB.TCDGTERMINALCHQMOVIL SET FCESTATUS='L' WHERE FCTERMINAL=paFCTERMINAL;
    COMMIT;    
    OPEN VCURSORSALIDA FOR     
        SELECT 'OK' AS MSG FROM DUAL;
    RETURN VCURSORSALIDA;

EXCEPTION 
   WHEN OTHERS THEN 
        ROLLBACK; 
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;


END PQDGBITACORACHEQUEMOVIL;
/


--
-- PQDGCHEQUESBC  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGCHEQUESBC AS


FUNCTION  FNDGSCHEQUE (    PAIMX01        IN DIGWEB.IMX01.IMX01%TYPE)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
      SELECT APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,STATIMAX,IMX11,IMX12,IMX13,
         IMX14,IMX15,IMX16,IMX17,IMX18,IMX19,IMX20,FCCLIENTEUNICO,FIDOMICILIA,FISUCURSALDOM,FDALTA,FDMODIFICACION
    FROM DIGWEB.IMX01 WHERE IMX01=PAIMX01; 
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



FUNCTION  FNDGSIMX01 (    paAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            paEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
      SELECT APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,STATIMAX,IMX11,IMX12,IMX13,
         IMX14,IMX15,IMX16,IMX17,IMX18,IMX19,IMX20,FCCLIENTEUNICO,FIDOMICILIA,FISUCURSALDOM,FDALTA,FDMODIFICACION
    FROM DIGWEB.IMX01 WHERE APPIMX=PAAPPIMX
        AND EDOIMX=PAEDOIMX ORDER BY EDOIMX,IMX09; 
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;

FUNCTION  FNDGSIMX20 (    paAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            paEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                            paIMX20        IN DIGWEB.IMX01.IMX20%TYPE)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
      SELECT APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,STATIMAX,IMX11,IMX12,IMX13,
         IMX14,IMX15,IMX16,IMX17,IMX18,IMX19,IMX20,FCCLIENTEUNICO,FIDOMICILIA,FISUCURSALDOM,FDALTA,FDMODIFICACION
    FROM DIGWEB.IMX01 WHERE APPIMX=PAAPPIMX
        AND EDOIMX=PAEDOIMX 
        AND IMX20=PAIMX20
        ORDER BY EDOIMX,IMX09; 
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;

FUNCTION  FNDGSTOTIMX01 (    paAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            paEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
      SELECT COUNT(EXPIMX)
    FROM DIGWEB.IMX01 WHERE APPIMX=PAAPPIMX
        AND EDOIMX=PAEDOIMX ORDER BY IMX01; 
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;

FUNCTION  FNDGSTOTIMX20 (    paAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            paEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                            paIMX20        IN DIGWEB.IMX01.IMX20%TYPE)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
      SELECT COUNT(EXPIMX)
    FROM DIGWEB.IMX01 WHERE APPIMX=PAAPPIMX
        AND EDOIMX=PAEDOIMX 
        AND IMX20=paIMX20 ORDER BY IMX01; 
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;

FUNCTION  FNDGSGETFECHA 
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
    select TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS') from dual;
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;



FUNCTION  FNDGSGETFECHA2 
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
      select TO_CHAR(SYSDATE,'YYMMDD') from dual; 
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;


FUNCTION FNDGUEDOIMX18               (PAEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAIMX18        IN DIGWEB.IMX01.IMX18%TYPE,
                                      PAIMX01        IN DIGWEB.IMX01.IMX01%TYPE
                                       )

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

        UPDATE DIGWEB.IMX01 SET EDOIMX=PAEDOIMX , IMX18=PAIMX18
        WHERE IMX01=PAIMX01;
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo el Estatus del Cheque') MSG FROM DUAL; 
            RETURN VCursorsalida;    
        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 

FUNCTION FNDGUEDOIMX               (PAEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAEDOIMX2        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE
                                       )

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

        UPDATE DIGWEB.IMX01 SET EDOIMX=PAEDOIMX2
        WHERE EDOIMX=PAEDOIMX AND APPIMX=PAAPPIMX;
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo el Estatus de Generacion de Archivo sin Validar') MSG FROM DUAL; 
            RETURN VCursorsalida;    
        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 

FUNCTION FNDGUEDOIMX20               (PAEDOIMX        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAEDOIMX2        IN DIGWEB.IMX01.EDOIMX%TYPE,
                                      PAAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                                      PAIMX20        IN DIGWEB.IMX01.IMX20%TYPE
                                       )

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

        UPDATE DIGWEB.IMX01 SET EDOIMX=PAEDOIMX2
        WHERE EDOIMX=PAEDOIMX AND APPIMX=PAAPPIMX AND IMX20=PAIMX20;
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo el Estatus  Archivo de Devolucion') MSG FROM DUAL; 
            RETURN VCursorsalida;    
        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 

FUNCTION  FNDGSREPPORF (    PAAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            PAFECHAINI        IN VARCHAR2,
                            PAFECHAFIN        IN VARCHAR2)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
SELECT APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,STATIMAX,IMX11,IMX12,IMX13,
         IMX14,IMX15,IMX16,IMX17,IMX18,IMX19,IMX20,FCCLIENTEUNICO,FIDOMICILIA,FISUCURSALDOM,FDALTA,FDMODIFICACION
    FROM DIGWEB.IMX01 WHERE APPIMX='CHEQUESMARTPHONE' AND FDALTA BETWEEN TO_DATE (PAFECHAINI,
                                                'DD/MM/YY HH24:MI:SS')
                                   AND  TO_DATE (PAFECHAFIN,
                                                 'DD/MM/YY HH24:MI:SS') ORDER BY APPIMX,FDALTA; 
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;

FUNCTION  FNDGSTOTREPPORF (    PAAPPIMX        IN DIGWEB.IMX01.APPIMX%TYPE,
                            PAFECHAINI        IN VARCHAR2,
                            PAFECHAFIN        IN VARCHAR2)
RETURN DIGCURSOR

IS
VCURSORSALIDA   DIGCURSOR;
VFCERRORSQL     VARCHAR2(500);

BEGIN 

      OPEN VCURSORSALIDA FOR 
SELECT COUNT(EXPIMX)
    FROM DIGWEB.IMX01 WHERE APPIMX='CHEQUESMARTPHONE' AND FDALTA BETWEEN TO_DATE (PAFECHAINI,
                                                'DD/MM/YY HH24:MI:SS')
                                   AND  TO_DATE (PAFECHAFIN,
                                                 'DD/MM/YY HH24:MI:SS') ORDER BY APPIMX,FDALTA; 
      RETURN VCURSORSALIDA;      
EXCEPTION 
   WHEN OTHERS THEN
        ROLLBACK;          
        VFCERRORSQL := SQLERRM; 
        OPEN VCURSORSALIDA FOR 
            SELECT ('ERROR: ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCURSORSALIDA;
END;


END PQDGCHEQUESBC;
/


--
-- PQDGTCDGCHQDEV  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGTCDGCHQDEV AS 

FUNCTION FNDIGABCTCDGCHQDEV              (PAFIINOPCION                    IN    NUMBER                                                    ,
                                             PAFIIDCAUSA                   IN    DIGWEB.TCDGCHQDEV.FIIDCAUSA%TYPE                       , 
                                             PAFCDESCRIPCION                 IN    DIGWEB.TCDGCHQDEV.FCDESCRIPCION%TYPE                     ,
                                             PAFIESTATUS                   IN    DIGWEB.TCDGCHQDEV.FIESTATUS%TYPE                       , 
                                             PAFCINICIO                      IN    VARCHAR2                                                  ,
                                             PAFCFIN                         IN    VARCHAR2                                                  ,
                                             PAFCUSURBD                      IN    VARCHAR2)

RETURN DIGCURSOR 

IS 

VCursorsalida DIGCURSOR; 

VFIID           NUMBER:=0; 
VFIERROR        NUMBER:=0; 
VFIRESULT       NUMBER:=0; 
VFCERRORSQL     VARCHAR2(300); 


BEGIN 
    BEGIN 

        IF PAFIINOPCION = 1 THEN 
             BEGIN 

                 SELECT 1 
                 INTO VFIRESULT 
                 FROM DUAL 
                 WHERE EXISTS(SELECT FIIDCAUSA 
                              FROM DIGWEB.TCDGCHQDEV
                              WHERE FCDESCRIPCION = PAFCDESCRIPCION); 

                 IF VFIRESULT > 0 THEN 

                     OPEN VCursorsalida FOR 
                         SELECT ('El tipo de extension ya existe.') MSG FROM DUAL; 
                     RETURN VCursorsalida;             

                 END IF; 

             EXCEPTION 
             WHEN NO_DATA_FOUND THEN 

                SELECT NVL(MAX(FIIDCAUSA),0) + 1 
                INTO VFIID 
                FROM DIGWEB.TCDGCHQDEV;

                INSERT INTO DIGWEB.TCDGCHQDEV(FIIDCAUSA,FCDESCRIPCION,FIESTATUS,FCUSRMODIFICO,FDALTA,FDMODIFICACION)
                VALUES(VFIID,PAFCDESCRIPCION,PAFIESTATUS,PAFCUSURBD,SYSDATE,SYSDATE); 
                COMMIT; 

                OPEN VCursorsalida FOR 
                    SELECT ('Se agrego el tipo de extension') MSG FROM DUAL; 
                RETURN VCursorsalida; 

             END;
        
        ELSIF PAFIINOPCION = 2 THEN
        
             BEGIN 

                 SELECT 1 
                 INTO VFIRESULT 
                 FROM DUAL 
                 WHERE EXISTS(SELECT FIIDCAUSA 
                              FROM DIGWEB.TCDGCHQDEV
                              WHERE FIIDCAUSA = PAFIIDCAUSA); 

                 IF VFIRESULT > 0 THEN 

                     OPEN VCursorsalida FOR 
                         SELECT ('El id de tipo de extension ya existe.') MSG FROM DUAL; 
                     RETURN VCursorsalida;             

                 END IF; 

             EXCEPTION 
             WHEN NO_DATA_FOUND THEN 
                

                INSERT INTO DIGWEB.TCDGCHQDEV(FIIDCAUSA,FCDESCRIPCION,FIESTATUS,FCUSRMODIFICO,FDALTA,FDMODIFICACION)
                VALUES(PAFIIDCAUSA,PAFCDESCRIPCION,PAFIESTATUS,PAFCUSURBD,SYSDATE,SYSDATE); 
                COMMIT; 

                OPEN VCursorsalida FOR 
                    SELECT ('Se agrego el tipo de extension') MSG FROM DUAL; 
                RETURN VCursorsalida; 

             END;

        ELSIF PAFIINOPCION = 3 THEN 

            UPDATE DIGWEB.TCDGCHQDEV SET FCDESCRIPCION = PAFCDESCRIPCION, FIESTATUS = PAFIESTATUS, 
                                          FCUSRMODIFICO = PAFCUSURBD, FDMODIFICACION = SYSDATE 
            WHERE FIIDCAUSA = PAFIIDCAUSA; 
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se actualizo el tipo de extension') MSG FROM DUAL; 
            RETURN VCursorsalida; 

        ELSIF PAFIINOPCION = 4 THEN 

            DELETE DIGWEB.TCDGCHQDEV  
            WHERE FIIDCAUSA = PAFIIDCAUSA; 
            COMMIT; 

            OPEN VCursorsalida FOR 
                SELECT ('Se elimino el tipo de extension') MSG FROM DUAL; 
            RETURN VCursorsalida; 

        ELSIF PAFIINOPCION = 5 THEN  

            OPEN VCursorsalida FOR 

                SELECT FIIDCAUSA,FCDESCRIPCION,FIESTATUS,FCUSRMODIFICO,FDALTA,FDMODIFICACION
                FROM DIGWEB.TCDGCHQDEV
                WHERE FIIDCAUSA = PAFIIDCAUSA
                ORDER BY FIESTATUS,FIIDCAUSA;
                             

            RETURN VCursorsalida;   


        ELSIF PAFIINOPCION = 6 THEN  

            OPEN VCursorsalida FOR    

                SELECT FIIDCAUSA,FCDESCRIPCION,FIESTATUS,FCUSRMODIFICO,FDALTA,FDMODIFICACION
                FROM DIGWEB.TCDGCHQDEV 
                WHERE FCDESCRIPCION LIKE '%' || PAFCDESCRIPCION || '%' 
                ORDER BY FIESTATUS,FIIDCAUSA;             

            RETURN VCursorsalida;               

        ELSIF PAFIINOPCION = 7 THEN  

            OPEN VCursorsalida FOR    

                SELECT FIIDCAUSA,FCDESCRIPCION,FIESTATUS,FCUSRMODIFICO,FDALTA,FDMODIFICACION
                FROM DIGWEB.TCDGCHQDEV 
                WHERE FCDESCRIPCION = PAFCDESCRIPCION 
                ORDER BY FIESTATUS,FIIDCAUSA;             

            RETURN VCursorsalida;  
            
        ELSIF PAFIINOPCION = 8 THEN  

            OPEN VCursorsalida FOR    

                SELECT FIIDCAUSA,FCDESCRIPCION,FIESTATUS,FCUSRMODIFICO,FDALTA,FDMODIFICACION
                FROM DIGWEB.TCDGCHQDEV 
                WHERE TRUNC(FDALTA,'DDD') BETWEEN TO_DATE (PAFCINICIO,'dd-mm-yyyy')  AND  TO_DATE (PAFCFIN,'dd-mm-yyyy') 
                ORDER BY FIESTATUS,FIIDCAUSA;

            RETURN VCursorsalida; 
            
        ELSIF PAFIINOPCION = 9 THEN  

            OPEN VCursorsalida FOR    

                SELECT FIIDCAUSA,FCDESCRIPCION,FIESTATUS,FCUSRMODIFICO,FDALTA,FDMODIFICACION
                FROM DIGWEB.TCDGCHQDEV 
                ORDER BY FIIDCAUSA;

            RETURN VCursorsalida;             

        END IF; 

        EXCEPTION 
        WHEN OTHERS THEN 
        BEGIN 
            VFIERROR := 1; 
            VFCERRORSQL := SQLERRM; 

        END; 
    END; 
        IF VFIERROR = 1 THEN 
            ROLLBACK; 
                OPEN VCursorsalida FOR 
                    SELECT ('Se realizo el rollback ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
                RETURN VCursorsalida; 
        END IF;         

    EXCEPTION 
    WHEN OTHERS THEN         
        VFCERRORSQL := SQLERRM; 
        OPEN VCursorsalida FOR 
            SELECT ('ERROR ' || VFCERRORSQL) MSG FROM DUAL; 
        RETURN VCursorsalida; 
END; 

END PQDGTCDGCHQDEV;
/


--
-- PQDGDIGVISORUNICO  (Package Body) 
--
CREATE OR REPLACE PACKAGE BODY DIGWEB.PQDGDIGVISORUNICO AS
        FUNCTION FNDGSDOCAPPS   (cliente_unico        IN   DIGWEB.IMX01.IMX20%TYPE ,
                                 http                 IN   VARCHAR2                ,
                                 tit_aplic_micro      IN   DIGWEB.IMX01.APPIMX%TYPE,
                                 tit_aplic_iusa       IN   DIGWEB.IMX01.APPIMX%TYPE,
                                 statusimxpag         IN   DIGWEB.IMX02.STATUSIMX%TYPE,
                                 statusimxdoc         IN   DIGWEB.IMX03.STATUSIMX%TYPE,
                                 statusetapa          IN   DIGWEB.IMX02.FIETAPA%TYPE,
                                 statussubprod        IN   DIGWEB.IMX02.FISUBPRODUCTO%TYPE)
        RETURN DIGCURSOR

        IS
                VCURSORSALIDA   DIGCURSOR;
                VFCERRORSQL     VARCHAR2(500);
        BEGIN 
            IF(statusetapa = 1 AND statussubprod = 1) THEN
                OPEN VCURSORSALIDA FOR 
                     SELECT   R.NOMDOCIMX , R.IDDOCIMX, R.DOCIMX|| R.EXPIMX,(http || V.FCALIAS || R.FCRUTAIMG) FCRUTAHTML, 
                              R.APPIMX, R.EXPIMX, 'OK' AS MSG, R.PAGIMX, R.IMX01, R.FECDICIMX
                     FROM
                         (
                          SELECT D.NOMDOCIMX , D.IDDOCIMX, D.DOCIMX,
                                 (CASE WHEN INSTR(P.RUTIMX,'RESPALDOS2',1) > 0 THEN
                                   ('/RESPALDOS2')
                                  ELSE
                                   SUBSTR(P.RUTIMX,1,INSTR(P.RUTIMX,'/' || 'img' || '/' || 'digitalizacion_web' || '/',1)-1)
                                  END)FCSHARED ,

                                 (CASE WHEN INSTR(P.RUTIMX,'RESPALDOS2',1) > 0 THEN
                                   SUBSTR(P.RUTIMX,INSTR(P.RUTIMX,'/' || 'digitalizacion_web' || '/',1) + LENGTH('/' || 'digitalizacion_web' || '/')-1)
                                  ELSE
                                   SUBSTR(P.RUTIMX,INSTR(P.RUTIMX,'/' || 'img' || '/' || 'digitalizacion_web' || '/',1) + LENGTH('/' || 'img' || '/')-1)
                                  END)FCRUTAIMG,

                                 I.APPIMX, I.EXPIMX, 'OK' AS MSG, P.PAGIMX, I.IMX01, P.FECDICIMX
                          FROM        DIGWEB.IMX03   P
                          INNER JOIN  DIGWEB.IMX02   D   ON
                                (    D.APPIMX    =   P.APPIMX 
                                 AND D.EXPIMX    =   P.EXPIMX 
                                 AND D.DOCIMX    =   P.DOCIMX)
                          INNER JOIN  DIGWEB.IMX01   I   ON
                                (    I.APPIMX    =   P.APPIMX 
                                 AND I.EXPIMX    =   P.EXPIMX)
                          WHERE (    I.APPIMX    =   tit_aplic_micro 
                                 OR  I.APPIMX    =   tit_aplic_iusa)
                            AND I.IMX20          =   cliente_unico
                            AND D.STATUSIMX      =   statusimxpag
                            AND P.STATUSIMX      =   statusimxdoc
                            AND D.FIETAPA        =   statusetapa 
                            AND D.FISUBPRODUCTO  =   statussubprod
                         ) R  
                     INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON 
                               V.FCRUTASOL       =  R.FCSHARED
                     ORDER BY R.APPIMX, R.EXPIMX, R.IDDOCIMX, R.PAGIMX ;
            END IF;

            IF(statusetapa = -1 AND statussubprod = -1) THEN
                OPEN VCURSORSALIDA FOR 
                     SELECT   R.NOMDOCIMX , R.IDDOCIMX, R.DOCIMX|| R.EXPIMX,(http || V.FCALIAS || R.FCRUTAIMG) FCRUTAHTML, 
                              R.APPIMX, R.EXPIMX, 'OK' AS MSG, R.PAGIMX, R.IMX01, R.FECDICIMX
                     FROM
                         (
                          SELECT D.NOMDOCIMX , D.IDDOCIMX, D.DOCIMX, 
                                 (CASE WHEN INSTR(P.RUTIMX,'RESPALDOS2',1) > 0 THEN
                                   ('/RESPALDOS2')
                                  ELSE
                                   SUBSTR(P.RUTIMX,1,INSTR(P.RUTIMX,'/' || 'img' || '/' || 'digitalizacion_web' || '/',1)-1)
                                  END)FCSHARED ,

                                 (CASE WHEN INSTR(P.RUTIMX,'RESPALDOS2',1) > 0 THEN
                                   SUBSTR(P.RUTIMX,INSTR(P.RUTIMX,'/' || 'digitalizacion_web' || '/',1) + LENGTH('/' || 'digitalizacion_web' || '/')-1)
                                  ELSE
                                   SUBSTR(P.RUTIMX,INSTR(P.RUTIMX,'/' || 'img' || '/' || 'digitalizacion_web' || '/',1) + LENGTH('/' || 'img' || '/')-1)
                                  END)FCRUTAIMG,

                                 I.APPIMX, I.EXPIMX, 'OK' AS MSG, P.PAGIMX, I.IMX01, P.FECDICIMX
                          FROM        DIGWEB.IMX03   P
                          INNER JOIN  DIGWEB.IMX02   D   ON
                                (    D.APPIMX    =   P.APPIMX 
                                 AND D.EXPIMX    =   P.EXPIMX 
                                 AND D.DOCIMX    =   P.DOCIMX)
                          INNER JOIN  DIGWEB.IMX01   I   ON
                                (    I.APPIMX    =   P.APPIMX 
                                 AND I.EXPIMX    =   P.EXPIMX)
                          WHERE (    I.APPIMX    =   tit_aplic_micro 
                                 OR  I.APPIMX    =   tit_aplic_iusa)
                            AND I.IMX20          =   cliente_unico
                            AND D.STATUSIMX      =   statusimxpag
                            AND P.STATUSIMX      =   statusimxdoc
                         ) R  
                     INNER JOIN DIGWEB.DIG_UNIDAD_VOLUMEN V ON 
                               V.FCRUTASOL       =  R.FCSHARED
                     ORDER BY R.APPIMX, R.EXPIMX, R.IDDOCIMX, R.PAGIMX ;
            END IF;            
                RETURN VCURSORSALIDA;
        EXCEPTION 
                WHEN OTHERS THEN
                     VFCERRORSQL := SQLERRM; 
                     OPEN VCURSORSALIDA FOR 
                          SELECT ('ERROR' || VFCERRORSQL) MSG FROM DUAL;
                     RETURN VCURSORSALIDA;

       END;
END PQDGDIGVISORUNICO;
--PERMISOS DEL PAQUETE AL USUARIO USRDIGWEB
/


--
-- INSERT_LOG  (Procedure) 
--
CREATE OR REPLACE PROCEDURE DIGWEB.insert_log
  (p_usuario  IN digweb.logs_digitaliza.usuario%TYPE
  ,p_producto IN digweb.logs_digitaliza.producto%TYPE
  ,p_pcname  IN digweb.logs_digitaliza.pc_name%TYPE
  ,p_dirip   IN digweb.logs_digitaliza.dir_ip%TYPE
  ,p_dominio  IN digweb.logs_digitaliza.dominio%TYPE
  ,p_iddesc  IN digweb.logs_digitaliza.id_desc%TYPE)

IS
/************************************************************************************************
Proyecto:Digitalizacion Web
Descripcion:
Par metros de entrada: p_usuario  IN digweb.logs_digitaliza.usuario%TYPE
                       ,p_producto IN digweb.logs_digitaliza.producto%TYPE
                       ,p_pcname  IN digweb.logs_digitaliza.pc_name%TYPE
                       ,p_dirip   IN digweb.logs_digitaliza.dir_ip%TYPE
                       ,p_dominio  IN digweb.logs_digitaliza.dominio%TYPE
                       ,p_iddesc  IN digweb.logs_digitaliza.id_desc%TYPE)
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: JOSÉ ALFREDO ORTEGA HERNÁNDEZ
Fecha: 26-ABR-2007
**************************************************************************************************/

BEGIN
  INSERT INTO digweb.logs_digitaliza (usuario, producto, fecha, pc_name, dir_ip, dominio, id_desc)
  VALUES (p_usuario, p_producto, SYSDATE, p_pcname, p_dirip, p_dominio, p_iddesc);
  COMMIT;
END insert_log;
/


--
-- TMPFNCLSWLS0001P  (Procedure) 
--
CREATE OR REPLACE PROCEDURE DIGWEB.TMPFNCLSWLS0001P( paSolicitud  IN IMX01.appimx%TYPE--CAPTACION
                         ,paCuenta     IN DIGWEB.IMX01.imx01%TYPE--00120102010201
                         ,paCatODoc    IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                         ,paDocumento  IN DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                         ,paImg        IN DIGWEB.IMX03.imgimx%TYPE--imagen.jpg
                         ,paRutImg     IN DIGWEB.IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
IS
/************************************************************************************************
Proyecto:
Descripcion: CREAD DOCUMENTO, AGREGA PAGINAS A DOCUMENTO Y CAMBIA EL ESTADO DEL EXPEDIENTE A M
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                       ,paCuenta IN IMX01.imx01%TYPE--00120102010201
                       ,paCatODoc IN CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                       ,paDocumento IN CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                       ,paImg IMX03.imgimx%TYPE--imagen.jpg
                       ,paRutImg IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
vlBanderaD     NUMBER;
vlMaximo       NUMBER;
APPIMX         DIGWEB.imx03.appimx%TYPE;
EXPIMX         DIGWEB.imx03.expimx%TYPE;
DOCIMX         DIGWEB.imx03.docimx%TYPE;
PAGIMX         NUMBER;
DESCDOC        DIGWEB.CATDOCUMENTOS.fcdescdocumento%TYPE;
FILDOC         DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE;

BEGIN
   UPDATE DIGWEB.IMX01 IM SET IM.EDOIMX='M'
    WHERE IM.APPIMX =paSolicitud
      AND IM.IMX01 = paCuenta;

         SELECT COUNT(1) INTO vlBanderaD
           FROM DIGWEB.IMX02 IM2,
                   ( SELECT IM.APPIMX
                           ,IM.EXPIMX
                       FROM DIGWEB.IMX01 IM
                      WHERE IM.APPIMX =paSolicitud
                        AND IM.IMX01 = paCuenta) IM1
                      WHERE IM2.EXPIMX = IM1.EXPIMX
                        AND IM2.IDDOCIMX = paDocumento;

                           IF vlBanderaD = 1 THEN
                             --EXSTE EL DOCUMENTO
                              SELECT MAX(IM3.PAGIMX)+1 INTO PAGIMX
                               FROM DIGWEB.IMX03 IM3
                                   ,(SELECT IM2.EXPIMX
                                           ,IM2.DOCIMX
                                       FROM DIGWEB.IMX02 IM2
                                           ,( SELECT IM.APPIMX
                                                    ,IM.EXPIMX
                                                FROM DIGWEB.IMX01 IM
                                               WHERE IM.APPIMX =paSolicitud
                                                 AND IM.IMX01 = paCuenta ) IM1
                                               WHERE IM2.EXPIMX = IM1.EXPIMX
                                                 AND IM2.IDDOCIMX = paDocumento
                                             ) IM4
                                       WHERE IM3.EXPIMX = IM4.EXPIMX
                                         AND IM3.DOCIMX = IM4.DOCIMX
                                         AND IM3.APPIMX = paSolicitud;

                                            SELECT DISTINCT IM3.APPIMX
                                                           ,IM3.EXPIMX
                                                           ,IM3.DOCIMX
                                                       INTO APPIMX
                                                           ,EXPIMX
                                                           ,DOCIMX
                                                       FROM DIGWEB.IMX03 IM3
                                                           ,( SELECT IM2.EXPIMX
                                                                    ,IM2.DOCIMX
                                                                FROM DIGWEB.IMX02 IM2
                                                                    ,( SELECT IM.APPIMX
                                                                             ,IM.EXPIMX
                                                                         FROM DIGWEB.IMX01 IM
                                                                        WHERE IM.APPIMX = paSolicitud
                                                                          AND IM.IMX01 = paCuenta
                                                                             ) IM1
                                                                WHERE IM2.EXPIMX = IM1.EXPIMX
                                                                  AND IM2.IDDOCIMX = paDocumento) IM4
                                                                WHERE IM3.EXPIMX = IM4.EXPIMX
                                                                  AND IM3.DOCIMX = IM4.DOCIMX
                                                                  AND IM3.APPIMX = paSolicitud;

                                                                     INSERT INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                                                     VALUES( APPIMX
                                                                            ,EXPIMX
                                                                            ,DOCIMX
                                                                            ,PAGIMX
                                                                            ,paImg
                                                                            ,paRutImg);
                                                                      COMMIT;


                           ELSE
                              --NO EXISTE EL DOCUMENTO
                              SELECT CATD.fiIdDocumento
                                    ,CATD.fcDescDocumento
                                INTO FILDOC
                                    ,DESCDOC
                                FROM DIGWEB.CATDocumentos CATD
                               WHERE CATD.fiOpeDocumento = paCatODoc
                                 AND CATD.fiIdDocumento=paDocumento;

                                    SELECT IM.APPIMX
                                          ,IM.EXPIMX
                                      INTO APPIMX,EXPIMX
                                      FROM DIGWEB.IMX01 IM
                                     WHERE IM.APPIMX = paSolicitud
                                       AND IM.IMX01 = paCuenta;
                                       ----------OBTENEMOS CONSECUTIVO
                                          SELECT MAX(IM2.DOCIMX)+1
                                            INTO vlMaximo
                                            FROM DIGWEB.IMX02 IM2
                                                ,( SELECT IM.APPIMX
                                                         ,IM.EXPIMX
                                                     FROM DIGWEB.IMX01 IM
                                                    WHERE IM.APPIMX = paSolicitud
                                                      AND IM.IMX01 = paCuenta
                                                  ) IM1
                                            WHERE IM2.EXPIMX = IM1.EXPIMX;

                                               IF vlMaximo IS NOT NULL THEN

                                                  INSERT INTO DIGWEB.IMX02 (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX)
                                                  VALUES(APPIMX,EXPIMX,vlMaximo,FILDOC,DESCDOC);

                                                  INSERT INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                                  VALUES(APPIMX,EXPIMX,vlMaximo,1,paImg,paRutImg);
                                                  COMMIT;
                                               ELSE

                                                  INSERT INTO DIGWEB.IMX02 (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX)
                                                  VALUES(APPIMX,EXPIMX,0,FILDOC,DESCDOC);
                                                  INSERT INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                                  VALUES(APPIMX,EXPIMX,0,1,paImg,paRutImg);
                                                  COMMIT;
                                               END IF;
                           END IF;

END;
/


--
-- TMPFNCLSWLS0003P  (Procedure) 
--
CREATE OR REPLACE PROCEDURE DIGWEB.TMPFNCLSWLS0003P ( paSolicitud  IN IMX01.appimx%TYPE--CAPTACION
                            ,paCuenta     IN IMX01.imx01%TYPE --00120102010201
                            ,paDocumento  IN IMX02.iddocimx%TYPE--2, 510,1,33
                            ,paPagina     IN IMX03.pagimx%TYPE) --1,2,3,4 ETC.
IS
/************************************************************************************************
Proyecto:
Descripcion: ELIMINA PAGINA DE UN DOCUMENTO
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN IMX02.iddocimx%TYPE--2, 510,1,33
                      ,paPagina IN IMX03.pagimx%TYPE--1,2,3,4 ETC.
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/

vlCons         IMX01.expimx%TYPE;
vlDoc          NUMBER;
vlCont         NUMBER;

BEGIN

   SELECT IM.expimx INTO vlCons
     FROM IMX01 IM
    WHERE IM.APPIMX = paSolicitud
      AND IM.IMX01 = paCuenta;

         SELECT IM2.DOCIMX INTO vlDoc
           FROM IMX02 IM2
               ,( SELECT IM.APPIMX
                        ,IM.EXPIMX
                    FROM IMX01 IM
                   WHERE IM.APPIMX = paSolicitud
                     AND IM.IMX01 = paCuenta ) IM1
                   WHERE IM2.EXPIMX = IM1.EXPIMX
                     AND IM2.IDDOCIMX = paDocumento;

                        DELETE
                          FROM IMX03 IM3
                         WHERE IM3.APPIMX = paSolicitud
                           AND IM3.expimx = vlCons
                           AND IM3.docimx = vlDoc
                           AND IM3.pagimx = paPagina;
                        COMMIT;

                           SELECT COUNT(1) INTO vlCont
                             FROM IMX03 IM3
                            WHERE IM3.APPIMX = paSolicitud
                              AND IM3.EXPIMX = vlCons
                              AND IM3.DOCIMX = vlDoc;

                                 IF vlCont = 0 THEN
                                    DELETE
                                      FROM IMX02 IM2
                                     WHERE IM2.APPIMX = paSolicitud
                                       AND IM2.EXPIMX = vlCons
                                       AND IM2.DOCIMX = vlDoc;
                                    COMMIT;

                                       SELECT COUNT(1) INTO vlCont
                                         FROM IMX02 IM2
                                        WHERE IM2.APPIMX = paSolicitud
                                          AND IM2.EXPIMX = vlCons;

                                             IF vlCont = 0 THEN
                                                UPDATE DIGWEB.IMX01 IM
                                                   SET IM.EDOIMX = 'N'
                                                 WHERE IM.APPIMX = paSolicitud
                                                   AND IM.IMX01 = paCuenta;
                                                COMMIT;
                                             END IF;

                                END IF;
                                   EXCEPTION WHEN NO_DATA_FOUND THEN NULL;




--EXCEPTION
 --  WHEN OTHERS THEN
  --   RETURN (NULL);
END;
/


--
-- TMPFNCLSWLS0004P  (Procedure) 
--
CREATE OR REPLACE PROCEDURE DIGWEB.TMPFNCLSWLS0004P ( paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                           ,paCuenta    IN IMX01.imx01%TYPE --00120102010201
                           ,paDocumento IN IMX02.iddocimx%TYPE) --2, 510,1,33
IS
/************************************************************************************************
Proyecto:
Descripcion: ELIMINA DOCUMENTO CON TODAS SUS PAGINAS
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN IMX02.iddocimx%TYPE--2, 510,1,33
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
vlCons         IMX01.expimx%TYPE;
vlDoc          NUMBER;
vlCont         NUMBER;
BEGIN

   SELECT IM.expimx
     INTO vlCons
    FROM IMX01 IM
   WHERE IM.APPIMX = paSolicitud
     AND IM.IMX01 = paCuenta;

        SELECT IM2.DOCIMX
          INTO vlDoc
          FROM IMX02 IM2
              ,( SELECT IM.APPIMX
                       ,IM.EXPIMX
                   FROM IMX01 IM
                  WHERE IM.APPIMX = paSolicitud
                    AND IM.IMX01 = paCuenta ) IM1
                  WHERE IM2.EXPIMX = IM1.EXPIMX
                    AND IM2.IDDOCIMX = paDocumento;

                       DELETE
                         FROM IMX03 IM3
                        WHERE IM3.APPIMX= paSolicitud
                          AND IM3.expimx = vlCons
                          AND IM3.docimx = vlDoc;

                             DELETE
                               FROM IMX02 IM2
                              WHERE IM2.APPIMX= paSolicitud
                                AND IM2.expimx = vlCons
                                AND IM2.iddocimx = paDocumento;
                             COMMIT;

                                SELECT COUNT(1)
                                  INTO vlCont
                                  FROM IMX02 IM2
                                 WHERE IM2.APPIMX = paSolicitud
                                   AND IM2.EXPIMX = vlCons;

                                      IF vlCont = 0 THEN
                                         UPDATE DIGWEB.IMX01 IM
                                            SET IM.EDOIMX = 'N'
                                          WHERE IM.APPIMX = paSolicitud
                                            AND IM.IMX01 = paCuenta;
                                         COMMIT;
                                      END IF;



--EXCEPTION
   --  WHEN OTHERS THEN
    -- RETURN NULL;
END;
/


--
-- TMPFNCLSWLS0013  (Procedure) 
--
CREATE OR REPLACE PROCEDURE DIGWEB.TMPFNCLSWLS0013
IS
/************************************************************************************************
Proyecto:
Descripcion: CAMBIA STATUS DE EXPEDIENTE A M AQUELLOS QUE TENGAN POR LO MENOS UN DOCUMENTO
             Y SEAN FINALIZAFOS INCORRECTAMENTE
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                       ,paCuenta IN IMX01.imx01%TYPE--00120102010201
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 09-OCT-2006
**************************************************************************************************/
vlExpi  IMX01.EXPIMX%TYPE;
vlApp   IMX01.APPIMX%TYPE;
vlTmp   NUMBER;

CURSOR cCursorPro IS
   SELECT DISTINCT(IM2.EXPIMX)
         ,IM2.APPIMX
     FROM IMX02 IM2
         ,( SELECT IM.APPIMX
           ,IM.EXPIMX
           ,IM.EDOIMX
       FROM IMX01 IM
      WHERE IM.EDOIMX='N') IM1
  WHERE IM2.EXPIMX = IM1.EXPIMX
    AND IM1.APPIMX = IM2.APPIMX;

BEGIN

   OPEN cCursorPro;
     LOOP
        FETCH cCursorPro INTO vlExpi
                             ,vlApp;
          EXIT WHEN cCursorPro%NOTFOUND;
            UPDATE IMX01 SET EDOIMX='M' WHERE APPIMX=vlApp AND EXPIMX = vlExpi;
       END LOOP;
    CLOSE cCursorPro;
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        NULL;
END; -- Procedure
/


--
-- TMPSPCLSWL0020  (Procedure) 
--
CREATE OR REPLACE PROCEDURE DIGWEB.TMPSPCLSWL0020
  (p_SOLICITUD  IN DIGWEB.IMX01.APPIMX%TYPE
  ,p_imx01      IN DIGWEB.IMX01.IMX01%TYPE
  ,p_imx02      IN DIGWEB.IMX01.IMX02%TYPE
  ,p_imx03      IN DIGWEB.IMX01.IMX03%TYPE
  ,p_imx04      IN DIGWEB.IMX01.IMX04%TYPE
  ,p_imx05      IN DIGWEB.IMX01.IMX05%TYPE
  ,p_imx06      IN DIGWEB.IMX01.IMX06%TYPE
  ,p_imx07      IN DIGWEB.IMX01.IMX07%TYPE
  ,p_imx08      IN DIGWEB.IMX01.IMX08%TYPE
  ,p_imx09      IN DIGWEB.IMX01.IMX09%TYPE
  ,p_imx11      IN DIGWEB.IMX01.IMX11%TYPE
  ,p_imx12      IN DIGWEB.IMX01.IMX12%TYPE
  ,p_imx13      IN DIGWEB.IMX01.IMX13%TYPE
  ,p_imx14      IN DIGWEB.IMX01.IMX14%TYPE
  ,p_imx15      IN DIGWEB.IMX01.IMX15%TYPE
  ,p_imx16      IN DIGWEB.IMX01.IMX16%TYPE

  )


IS
 v_max      NUMBER;
BEGIN
     SELECT NVL(MAX(t.expimx),0)+1
     INTO v_max
     FROM digweb.imx01 t
     WHERE t.appimx=UPPER(p_solicitud);

     INSERT INTO digweb.imx01 (APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,STATIMAX,IMX11,IMX12,IMX13,IMX14,IMX15,IMX16)
            VALUES(p_solicitud
                   ,v_max
                   ,'0'
                   ,'N'
                   ,p_imx01
                   ,p_imx02
                   ,p_imx03
                   ,p_imx04
                   ,p_imx05
                   ,p_imx06
                   ,p_imx07
                   ,p_imx08
                   ,p_imx09
                   ,TO_CHAR(SYSDATE,'DDMMYYHH24MISS')
                   ,1
                   ,p_imx11
                   ,p_imx12
                   ,p_imx13
                   ,p_imx14
                   ,p_imx15
                   ,p_imx16
                   );
      COMMIT;
END;
/


--
-- DAENCABEZADO  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.DAENCABEZADO(p_appimx VARCHAR2)
RETURN VARCHAR2
IS
/************************************************************************************************
Proyecto:DIGITALIZACION WEB
Descripcion:
Par metros de entrada:  p_appimx VARCHAR2

Par metros de salida: N/A
Valor de retorno: VARCHAR2
Par metros de entrada-salida: N/A
Datos de retorno URL
Desarrollador: José Alfredo Ortega
Fecha: 28-ABRIL-2007
**************************************************************************************************/

v_salida     VARCHAR2(64);
v_msg        VARCHAR2(64):='E';
v_fila        NUMBER;
BEGIN
 SELECT COUNT(1) FLS
 INTO v_fila
 FROM digweb.encabezado C
 WHERE c.appimx=UPPER(p_appimx);

 IF v_fila<=0 THEN

       RETURN v_msg;

 ELSE
      SELECT c.ruta
       INTO v_salida
       FROM digweb.encabezado c
       WHERE c.appimx=UPPER(p_appimx);
      RETURN v_salida;

  END IF;
EXCEPTION
WHEN OTHERS THEN
RETURN  NULL;
END;
/


--
-- DAEXPIMX  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.DAEXPIMX( paSolicitud     IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta         IN DIGWEB.IMX01.imx01%TYPE --00120102010201
                          )
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: ELIMINA DOCUMENTO CON TODAS SUS PAGINAS
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta         IN IMX01.imx01%TYPE
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: José Alfredo Ortega Hernandez, (SINERGY SOLUTIONS)
Fecha: 02-May-2007
**************************************************************************************************/

cCursorsalida PATYPES.RCGCURSOR;

BEGIN
   OPEN cCursorsalida FOR
      SELECT IM1.EXPIMX FROM DIGWEB.IMX01 IM1
      WHERE IM1.APPIMX = paSolicitud
      AND IM1.IMX01 = paCuenta;
 RETURN cCursorsalida;

EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- FNLLAVEIMX  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.FNllaveIMX(
                  p_appimx DIGWEB.imx01.appimx%TYPE,
                  p_01     DIGWEB.imx01.imx01%TYPE,
                  p_02     DIGWEB.imx01.imx02%TYPE,
                  p_03     DIGWEB.imx01.imx03%TYPE,
                  p_04     DIGWEB.imx01.imx04%TYPE,
                  p_05     DIGWEB.imx01.imx05%TYPE,
                  p_06     DIGWEB.imx01.imx06%TYPE,
                  p_07     DIGWEB.imx01.imx07%TYPE,
                  p_08     DIGWEB.imx01.imx08%TYPE,
                  p_09     DIGWEB.imx01.imx09%TYPE,
                  p_11     DIGWEB.imx01.imx11%TYPE,
                  p_12     DIGWEB.imx01.imx12%TYPE,
                  p_13     DIGWEB.imx01.imx13%TYPE,
                  p_14     DIGWEB.imx01.imx14%TYPE,
                  p_15     DIGWEB.imx01.imx15%TYPE,
                  p_16     DIGWEB.imx01.imx16%TYPE
                  )
         RETURN VARCHAR
IS
/************************************************************************************************
Proyecto:DIGITALIZACION WEB
Descripcion: CAMBIA ESTATUS DE PAGINA DEL DOCUMENTO
Par metros de entrada: p_appimx imx01.appimx%TYPE,
                  p_01     imx01.imx01%TYPE,
                  p_02     imx01.imx02%TYPE,
                  p_03     imx01.imx03%TYPE,
                  p_04     imx01.imx04%TYPE,
                  p_05     imx01.imx05%TYPE,
                  p_06     imx01.imx06%TYPE,
                  p_07     imx01.imx07%TYPE,
                  p_08     imx01.imx08%TYPE,
                  p_09     imx01.imx09%TYPE,
       p_11     imx01.imx11%TYPE,
   p_12     imx01.imx12%TYPE,
   p_13     imx01.imx13%TYPE,
   p_14     imx01.imx14%TYPE,
   p_15     imx01.imx15%TYPE,
   p_16     imx01.imx16%TYPE

Par metros de salida: N/A
Valor de retorno: VARCHAR
Par metros de entrada-salida: N/A
Datos de retorno LLAVE_DEL REGISTRO
Desarrollador: JOSE ALFREDO ORTEGA HERNANDEZ (SINERGY SOLUTIONS)
Fecha: 10-MAY-2007
**************************************************************************************************/


CURSOR llave_cur IS
     SELECT 'p_'||SUBSTR(w.fcclumna,4) fcclumna
     FROM digweb.taservcolumn w
     WHERE w.fcdescserv=UPPER(p_appimx)
     AND w.fctipocolumna=UPPER('K');
llave_reg    llave_cur%ROWTYPE;
v_llave     VARCHAR2(64);
v_long      NUMBER(3);
BEGIN
 OPEN llave_cur;
 LOOP
  FETCH llave_cur INTO llave_reg;
  EXIT WHEN llave_cur%NOTFOUND;

  IF llave_reg.fcclumna='p_01' THEN
       v_llave:=v_llave||p_01;
  END IF;

  IF llave_reg.fcclumna='p_02' THEN
       v_llave:=v_llave||p_02||'-';
  END IF;

  IF llave_reg.fcclumna='p_03' THEN
  v_llave:=v_llave||p_03||'-';

  END IF;
  IF llave_reg.fcclumna='p_04' THEN
  v_llave:=v_llave||p_04||'-';

  END IF;
  IF llave_reg.fcclumna='p_05' THEN
  v_llave:=v_llave||p_05||'-';

  END IF;
  IF llave_reg.fcclumna='p_06' THEN
  v_llave:=v_llave||p_06||'-';

  END IF;
  IF llave_reg.fcclumna='p_07' THEN
  v_llave:=v_llave||p_07||'-';

  END IF;
  IF llave_reg.fcclumna='p_08' THEN
  v_llave:=v_llave||p_08||'-';

  END IF;
  IF llave_reg.fcclumna='p_09' THEN
  v_llave:=v_llave||p_09||'-';

  /*end if;
  if llave_reg.fcclumna='p_10' then
  v_llave:=v_llave||p_10||'-';*/

  END IF;
  IF llave_reg.fcclumna='p_11' THEN
  v_llave:=v_llave||p_11||'-';

  END IF;
  IF llave_reg.fcclumna='p_12' THEN
  v_llave:=v_llave||p_12||'-';

  END IF;
  IF llave_reg.fcclumna='p_13' THEN
  v_llave:=v_llave||p_13||'-';

  END IF;
  IF llave_reg.fcclumna='p_14' THEN
  v_llave:=v_llave||p_14||'-';

  END IF;
  IF llave_reg.fcclumna='p_15' THEN
  v_llave:=v_llave||p_15||'-';

  END IF;
  IF llave_reg.fcclumna='p_16' THEN
  v_llave:=v_llave||p_16||'-';



  END IF;
 END LOOP;
 v_long:=LENGTH(V_LLAVE);

 v_llave:=SUBSTR(v_llave,1,v_long-1);
 RETURN v_llave;
 END;
/


--
-- INSERT_LOGS  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.INSERT_LOGS(  p_usuario  IN digweb.logs_digitaliza.usuario%TYPE
                          ,p_producto IN digweb.logs_digitaliza.producto%TYPE
                          ,p_pcname   IN digweb.logs_digitaliza.pc_name%TYPE
                          ,p_dirip    IN digweb.logs_digitaliza.dir_ip%TYPE
                          ,p_dominio  IN digweb.logs_digitaliza.dominio%TYPE
                          ,p_iddesc   IN digweb.logs_digitaliza.id_desc%TYPE)
RETURN VARCHAR2
AS
BEGIN
INSERT INTO digweb.logs_digitaliza (usuario, producto, fecha, pc_name, dir_ip, dominio, id_desc)
  VALUES (p_usuario, p_producto, SYSDATE, p_pcname, p_dirip, p_dominio, p_iddesc);
  COMMIT;
  RETURN('INSERTO');
END;
/


--
-- PRU  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.PRU

  RETURN  VARCHAR2 IS
CURSOR C IS SELECT PAGIMX FROM IMX03 WHERE APPIMX='CREDITO_WEB' AND EXPIMX = 28 AND DOCIMX= 0 ORDER BY  PAGIMX ASC;
PAGNUM NUMBER;
CONT  NUMBER := 1;
BEGIN
      OPEN c;
      LOOP
      FETCH c INTO PAGNUM;
      EXIT WHEN c%NOTFOUND;
         IF PAGNUM = 1 THEN
            CONT := 2;
         ELSE
            UPDATE IMX03
              SET PAGIMX = CONT
            WHERE APPIMX = 'CREDITO_WEB' AND EXPIMX = 28 AND DOCIMX = 0 AND PAGIMX = PAGNUM;
            CONT:=CONT+1;
         END IF;
      END LOOP;
      CLOSE c;
    COMMIT;
    RETURN 'YA SALIO' ;
EXCEPTION
   WHEN OTHERS THEN
       NULL;
END;
/


--
-- TMPDAFECHA  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPDAFECHA(paSolicitud     IN DIGWEB.IMX01.appimx%TYPE,
                             paCuenta           IN DIGWEB.IMX01.IMX01%TYPE)
RETURN VARCHAR

IS
vlFecha VARCHAR(20);

BEGIN

SELECT IMX10
INTO vlFecha
FROM DIGWEB.IMX01 IM1
WHERE IM1.APPIMX= paSolicitud
AND IM1.IMX01=paCuenta;
  RETURN(vlFecha);
END;
/


--
-- TMPDEVDOCTRA  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPDEVDOCTRA(fcdescdocumento VARCHAR2,
       ididioma NUMBER)
RETURN VARCHAR2
IS

v_salida      VARCHAR2(300);
v_msg         VARCHAR2(64):='E';
v_fila        NUMBER;

BEGIN
 SELECT COUNT(*)
 INTO v_fila
 FROM DIGWEB.CATDOCIDIOMA C
 WHERE c.FCDESCDOCTOESP=fcdescdocumento;

 IF v_fila<=0 THEN

       RETURN v_msg;

 ELSE
       SELECT c.FCDESCDOCTOtra
         INTO v_salida
       FROM DIGWEB.CATDOCIDIOMA c
       WHERE c.FCDESCDOCTOESP=fcdescdocumento;

      RETURN v_salida;

  END IF;
EXCEPTION
WHEN OTHERS THEN
RETURN  NULL;
END;
/


--
-- TMPDEVURL  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPDEVURL(p_appimx VARCHAR2,
       p_imx01 VARCHAR2,p_imx02 VARCHAR2 , p_imx03 VARCHAR2 , p_imx04 VARCHAR2 ,
       p_imx05 VARCHAR2 ,p_imx06 VARCHAR2 ,  p_imx07 VARCHAR2 , p_imx08 VARCHAR2 ,  p_imx09 VARCHAR2 , p_imx10 VARCHAR2 ,
       p_imx11 VARCHAR2 ,p_imx12 VARCHAR2 ,  p_imx13 VARCHAR2 , p_imx14 VARCHAR2 ,  p_imx15 VARCHAR2 , p_imx16 VARCHAR2 ,
       p_fromIP VARCHAR2 , p_usuarioimx VARCHAR2 ,  p_wsimx VARCHAR2 ,  p_ip VARCHAR2 ,  p_idOpeDoc VARCHAR2 ,
       p_idDocSel VARCHAR2 , p_dominio VARCHAR2 , p_nompc VARCHAR2 , p_subdep VARCHAR2 ,  p_et VARCHAR2)


RETURN VARCHAR2
IS

CURSOR cursorp IS
   SELECT PARAMETRO  FROM DIGWEB.ENVEXPPARAM WHERE APPIMX=UPPER(p_appimx) GROUP BY PARAMETRO ;

v_salida      VARCHAR2(300);
v_msg         VARCHAR2(64):='E';
v_fila        NUMBER;
v_parametro   VARCHAR(64);
v_temp        VARCHAR(200);
 sql_string  VARCHAR2(2000);
 v_temp2 VARCHAR2(400);

BEGIN
 SELECT COUNT(1) FLS
 INTO v_fila
 FROM DIGWEB.envexp C
 WHERE c.appimx=UPPER(p_appimx);

 IF v_fila<=0 THEN

       RETURN v_msg;

 ELSE
       SELECT c.url
         INTO v_salida
       FROM DIGWEB.envexp c
       WHERE c.appimx=UPPER(p_appimx);

      v_temp:=NULL ;

      OPEN cursorp;
          LOOP
            FETCH cursorp INTO v_parametro;
              EXIT WHEN cursorp%NOTFOUND;

              v_parametro:=LOWER(v_parametro);


                          sql_string := ' select case when ''' || v_parametro  || '''' || '=' ||  '''appimx''' || ' then ' ||  '''&' || v_parametro || '=' || p_appimx || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx01''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx01 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx02''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx02 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx03''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx03 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx04''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx04 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx05''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx05 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx06''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx06 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx07''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx07 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx08''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx08 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx09''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx09 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx10''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx10 || '''' ||

                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx11''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx11 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx12''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx12 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx13''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx13 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx14''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx14 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx15''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx15 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx16''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx16 || '''' ||

                                 ' when ''' || v_parametro  || '''' || '=' ||  '''fromip''' || ' then ' ||  '''&' || 'fromIP' || '=' || p_fromIP || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''usuarioimx''' || ' then ' ||  '''&' || v_parametro || '=' || p_usuarioimx || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''wsimx''' || ' then ' ||  '''&' || v_parametro || '=' || p_wsimx || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''ip''' || ' then ' ||  '''&' || v_parametro || '=' || p_ip || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''idopedoc''' || ' then ' ||  '''&' || 'idOpeDoc' || '=' || p_idOpeDoc || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''iddocsel''' || ' then ' ||  '''&' || 'idDocSel' || '=' || p_idDocSel || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''dominio''' || ' then ' ||  '''&' || v_parametro || '=' || p_dominio || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''nompc''' || ' then ' ||  '''&' || v_parametro || '=' || p_nompc || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''subdep''' || ' then ' ||  '''&' || v_parametro || '=' || p_subdep || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''et''' || ' then ' ||  '''&' || v_parametro || '=' || p_et || '''' ||
                                 ' end '
                                 ||'from dual';

                          EXECUTE IMMEDIATE sql_string INTO v_temp2;
                          DBMS_OUTPUT.PUT_LINE('temp2='|| v_temp2);

                          v_temp := v_temp || v_temp2;

          END LOOP;
      CLOSE cursorp;

      IF v_temp IS NOT NULL   THEN
          BEGIN
              v_temp:=  SUBSTR(v_temp, 2, LENGTH(v_temp));
              v_salida:= v_salida || '?';
              v_salida:= v_salida || v_temp;
          END;
      END IF;


      RETURN v_salida;

  END IF;
EXCEPTION
WHEN OTHERS THEN
RETURN  NULL;
END;
/


--
-- TMPDEVURL2  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPDEVURL2(p_appimx VARCHAR2,
       p_imx01 VARCHAR2,p_imx02 VARCHAR2 , p_imx03 VARCHAR2 , p_imx04 VARCHAR2 ,
       p_imx05 VARCHAR2 ,p_imx06 VARCHAR2 ,  p_imx07 VARCHAR2 , p_imx08 VARCHAR2 ,  p_imx09 VARCHAR2 , p_imx10 VARCHAR2 ,
       p_imx11 VARCHAR2 ,  p_imx12 VARCHAR2 , p_imx13 VARCHAR2 , p_imx14 VARCHAR2 ,  p_imx15 VARCHAR2 , p_imx16 VARCHAR2 ,
       p_fromIP VARCHAR2 , p_usuarioimx VARCHAR2 ,  p_wsimx VARCHAR2 ,  p_ip VARCHAR2 ,  p_idOpeDoc VARCHAR2 ,
       p_idDocSel VARCHAR2 , p_dominio VARCHAR2 , p_nompc VARCHAR2 , p_subdep VARCHAR2 ,  p_et VARCHAR2)


RETURN VARCHAR2
IS

CURSOR cursorp IS
   SELECT PARAMETRO FROM DIGWEB.ENVEXPPARAM WHERE APPIMX=UPPER(p_appimx) GROUP BY PARAMETRO ;

v_salida      VARCHAR2(300);
v_msg         VARCHAR2(64):='E';
v_fila        NUMBER;
v_parametro   VARCHAR(64);
v_temp        VARCHAR(200);
 sql_string  VARCHAR2(2000);
 v_temp2 VARCHAR2(400);

BEGIN
 SELECT COUNT(1) FLS
 INTO v_fila
 FROM DIGWEB.ENVEXPTER C
 WHERE c.appimx=UPPER(p_appimx);

 IF v_fila<=0 THEN

       RETURN v_msg;

 ELSE
       SELECT c.url
         INTO v_salida
       FROM DIGWEB.envexpter c
       WHERE c.appimx=UPPER(p_appimx);

      v_temp:=NULL ;

      OPEN cursorp;
          LOOP
            FETCH cursorp INTO v_parametro;
              EXIT WHEN cursorp%NOTFOUND;

              v_parametro:=LOWER(v_parametro);


                          sql_string := ' select case when ''' || v_parametro  || '''' || '=' ||  '''appimx''' || ' then ' ||  '''&' || v_parametro || '=' || p_appimx || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx01''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx01 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx02''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx02 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx03''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx03 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx04''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx04 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx05''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx05 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx06''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx06 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx07''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx07 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx08''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx08 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx09''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx09 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx10''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx10 || '''' ||

                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx11''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx11 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx12''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx12 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx13''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx13 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx14''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx14 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx15''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx15 || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''imx16''' || ' then ' ||  '''&' || v_parametro || '=' || p_imx16 || '''' ||

                                 ' when ''' || v_parametro  || '''' || '=' ||  '''fromip''' || ' then ' ||  '''&' || 'fromIP' || '=' || p_fromIP || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''usuarioimx''' || ' then ' ||  '''&' || v_parametro || '=' || p_usuarioimx || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''wsimx''' || ' then ' ||  '''&' || v_parametro || '=' || p_wsimx || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''ip''' || ' then ' ||  '''&' || v_parametro || '=' || p_ip || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''idopedoc''' || ' then ' ||  '''&' || 'idOpeDoc' || '=' || p_idOpeDoc || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''iddocsel''' || ' then ' ||  '''&' || 'idDocSel' || '=' || p_idDocSel || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''dominio''' || ' then ' ||  '''&' || v_parametro || '=' || p_dominio || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''nompc''' || ' then ' ||  '''&' || v_parametro || '=' || p_nompc || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''subdep''' || ' then ' ||  '''&' || v_parametro || '=' || p_subdep || '''' ||
                                 ' when ''' || v_parametro  || '''' || '=' ||  '''et''' || ' then ' ||  '''&' || v_parametro || '=' || p_et || '''' ||
                                 ' end '
                                 ||'from dual';

                          EXECUTE IMMEDIATE sql_string INTO v_temp2;
                          DBMS_OUTPUT.PUT_LINE('temp2='|| v_temp2);

                          v_temp := v_temp || v_temp2;

          END LOOP;
      CLOSE cursorp;

      IF v_temp IS NOT NULL   THEN
          BEGIN
              v_temp:=  SUBSTR(v_temp, 2, LENGTH(v_temp));
              v_salida:= v_salida || '?';
              v_salida:= v_salida || v_temp;
          END;
      END IF;


      RETURN v_salida;

  END IF;
EXCEPTION
WHEN OTHERS THEN
RETURN  NULL;
END;
/


--
-- TMPFN14JA  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFN14JA(
                          paSolicitud   IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                         ,paCuenta      IN DIGWEB.IMX01.IMX01%TYPE--00120102010201
                         ,paCatODoc     IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                         ,paDocumento   IN DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                         ,paRutImg      IN DIGWEB.IMX03.rutimx%TYPE
                         ,paSubproducto IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                            ,paEtapa        IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE --c:imagen/imagen.jpg
                         ,pausuarioimx  IN DIGWEB.IMX03.USUARIOIMX%TYPE
                         ,pawsimx       IN DIGWEB.IMX03.WSIMX%TYPE)
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: CREAD DOCUMENTO, AGREGA PAGINAS A DOCUMENTO Y CAMBIA EL ESTADO DEL EXPEDIENTE A M
Par metros de entrada:  paSolicitud IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                       ,paCuenta IN DIGWEB.IMX01.imx01%TYPE--00120102010201
                       ,paCatODoc IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                       ,paDocumento IN DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                       ,paImg DIGWEB.IMX03.imgimx%TYPE--imagen.jpg
                       ,paRutImg DIGWEB.IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
--cTemp          PATYPES.RCGCURSOR;
vlBanderaD     NUMBER;
vlMaximo       NUMBER;
vlAppimx       DIGWEB.IMX03.appimx%TYPE;
vlExpimx       DIGWEB.IMX03.expimx%TYPE;
vlDocimx       DIGWEB.IMX03.docimx%TYPE;
vlPagimx       NUMBER; --Maximo del deocumento
vlDescdoc      DIGWEB.CATDOCUMENTOS.fcdescdocumento%TYPE;
vlFildoc       DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE; --IDENTIFICADOR DEL TIPO DE DOCUMENTO
vlError        NUMBER;
vlStat         NUMBER; --STATUS IMX02
vlNum          NUMBER; --LOGITUD DEL IMX
paEtapa2     DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE; --c:imagen/imagen.jpg
--vlMaximoF      NUMBER :=0; -- MAXIMO CONSECUTIVO
--vlExiste       NUMBER; --EXISTEN REGISTROS CON FECHAS
--vlMaximoR      NUMBER;
--vlExpi         DIGWEB.IMX03.expimx%TYPE;
--vlImg          DIGWEB.IMX03.imgimx%TYPE;
--vSubproducto NUMBER;
--vEtapa NUMBER;

BEGIN
 BEGIN
  SELECT COUNT(1)  --JA CHECA LA EXISTENCIA DEL DOCUMETO DADO PADOCUMETO
  INTO vlBanderaD  --JA DE ACUERDO A UNA SOLICITUD Y UNA CUENTA
  FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                            FROM DIGWEB.IMX01 IM
                            WHERE IM.APPIMX =paSolicitud
                            AND IM.IMX01 = paCuenta) IM1
  WHERE IM2.EXPIMX = IM1.EXPIMX
  AND IM2.APPIMX = IM1.appimx
  AND IM2.IDDOCIMX = paDocumento
  AND IM2.fisubproducto=pasubproducto
  AND IM2.fietapa=paetapa;


  IF vlBanderaD > 0 THEN

    SELECT statusimx  --JA CHECA LA EXISTENCIA DEL DOCUMETO DADO PADOCUMETO
  INTO vlStat  --JA DE ACUERDO A UNA SOLICITUD Y UNA CUENTA
  FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                            FROM DIGWEB.IMX01 IM
                            WHERE IM.APPIMX =paSolicitud
                            AND IM.IMX01 = paCuenta) IM1
  WHERE IM2.EXPIMX = IM1.EXPIMX
  AND IM2.APPIMX = IM1.appimx
  AND IM2.IDDOCIMX = paDocumento
  AND IM2.fisubproducto=pasubproducto
  AND IM2.fietapa=paetapa;

  IF vlStat = 0 THEN
  SELECT IM.APPIMX,IM.EXPIMX
    INTO vlAppimx,vlExpimx
    FROM DIGWEB.IMX01 IM
    WHERE IM.APPIMX = paSolicitud
    AND IM.IMX01 = paCuenta;

  UPDATE DIGWEB.IMX02 IM2
                 SET  IM2.STATUSIMX =1
               WHERE IM2.APPIMX = paSolicitud
                 AND IM2.expimx = vlExpimx
                 AND IM2.iddocimx = paDocumento
                 AND IM2.fisubproducto=pasubproducto
                 AND IM2.fietapa=paetapa;
  COMMIT;
  END IF;

   --EXSTE EL DOCUMENTO --JA TRAE LA CANTIDAD DE PAGINAS DEL DOCUMENTO Y LE AGREGA UNO AL NUEVO
    SELECT NVL(COUNT(IM3.PAGIMX),0)+1
    INTO vlPagimx
    FROM DIGWEB.IMX03 IM3,(SELECT IM2.EXPIMX,IM2.DOCIMX,IM2.FISUBPRODUCTO,IM2.FIETAPA, IM2.APPIMX
                           FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                                   FROM DIGWEB.IMX01 IM
                                                   WHERE IM.APPIMX =paSolicitud
                                                   AND IM.IMX01 = paCuenta ) IM1
                           WHERE IM2.EXPIMX = IM1.EXPIMX
                           AND   IM2.APPIMX = IM1.APPIMX
                           AND IM2.IDDOCIMX = paDocumento
                           AND IM2.FISUBPRODUCTO=pasubproducto
                           AND IM2.FIETAPA=paetapa) IM4
    WHERE IM3.EXPIMX = IM4.EXPIMX
    AND IM3.APPIMX = IM4.APPIMX
    AND IM3.DOCIMX = IM4.DOCIMX
    AND IM3.FISUBPRODUCTO=IM4.FISUBPRODUCTO
    AND IM3.FIETAPA=IM4.FIETAPA;

    SELECT NVL(COUNT(IM3.PAGIMX),0)+1
    INTO vlNum
    FROM DIGWEB.IMX03 IM3,(SELECT IM2.EXPIMX,IM2.DOCIMX,IM2.FISUBPRODUCTO,IM2.FIETAPA, IM2.APPIMX
                           FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                                   FROM DIGWEB.IMX01 IM
                                                   WHERE IM.APPIMX =paSolicitud
                                                   AND IM.IMX01 = paCuenta ) IM1
                           WHERE IM2.EXPIMX = IM1.EXPIMX
                           AND   IM2.APPIMX = IM1.APPIMX
                           AND IM2.IDDOCIMX = paDocumento
                           AND IM2.FISUBPRODUCTO=pasubproducto
                           AND IM2.FIETAPA=paetapa) IM4
    WHERE IM3.EXPIMX = IM4.EXPIMX
    AND IM3.APPIMX = IM4.APPIMX
    AND IM3.DOCIMX = IM4.DOCIMX
    AND IM3.FISUBPRODUCTO=IM4.FISUBPRODUCTO
    AND IM3.FIETAPA=IM4.FIETAPA
    AND IM3.STATUSIMX=1;
    ---
    SELECT IM2.DOCIMX
    INTO vlDocimx
    FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                             FROM DIGWEB.IMX01 IM
                             WHERE IM.APPIMX =paSolicitud
                             AND IM.IMX01 = paCuenta ) IM1
    WHERE IM2.EXPIMX = IM1.EXPIMX
    AND   IM2.APPIMX = IM1.APPIMX
    AND IM2.IDDOCIMX = paDocumento
    AND IM2.FISUBPRODUCTO=pasubproducto
    AND IM2.FIETAPA=paetapa
    AND IM2.statusimx=1;
    ---
    SELECT IM.APPIMX,IM.EXPIMX
    INTO vlAppimx,vlExpimx
    FROM DIGWEB.IMX01 IM
    WHERE IM.APPIMX = paSolicitud
    AND IM.IMX01 = paCuenta;


/*IF paSolicitud='CREDITO_WEB' THEN
  BEGIN

  vSubproducto:=1;-- NUMBER;
  vEtapa:=1;-- NUMBER;

  END;
  ELSE
  BEGIN
   vSubproducto:=paSubproducto;-- NUMBER;
  vEtapa:=paEtapa;
  END;
 END IF;*/



        INSERT INTO DIGWEB.IMX03  (APPIMX, EXPIMX, DOCIMX, PAGIMX, IMGIMX, RUTIMX, STATUSIMX, FISUBPRODUCTO, FIETAPA, USUARIOIMX, WSIMX, FECDICIMX)
         VALUES( paSolicitud
                ,vlExpimx
                ,vlDocimx
                ,vlPagimx  --MAXIMO DEL DOCUMENTO
                ,CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlNum),4,0))),'.tiff')
                ,paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlNum),4,0))),'.tiff')
                ,1
                ,paSubproducto
                ,paEtapa
               -- ,vSubproducto,vEtapa
                ,pausuarioimx
                ,pawsimx
                ,SYSDATE);
        COMMIT;

        OPEN cCursorsalida FOR
          SELECT paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/' R1
                ,paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlNum),4,0))),'.tiff') R2 FROM DUAL;
        RETURN cCursorsalida;
  ELSE
  -----------------------

  IF paSolicitud='CREDITO_WEB' THEN
  BEGIN
    IF paSolicitud='CREDITO_WEB' AND  paDocumento = '356' THEN
      paEtapa2:='4';
    ELSIF paSolicitud='CREDITO_WEB' AND  (paDocumento = '282' OR paDocumento = '283')THEN
      paEtapa2:='9';
    ELSIF paSolicitud='CREDITO_WEB' AND  (paDocumento = '389' OR paDocumento = '390')THEN
      paEtapa2:='11';
    ELSIF paSolicitud='CREDITO_WEB' AND  (paDocumento = '146' OR paDocumento = '384' OR paDocumento = '385' OR paDocumento = '139' OR paDocumento = '386' OR paDocumento = '387'  OR paDocumento = '388')THEN
      paEtapa2:='10';
    ELSIF paSolicitud='CREDITO_WEB' AND  (paDocumento = '424' OR paDocumento = '401' OR paDocumento = '416' OR paDocumento = '132' OR paDocumento = '3')THEN
      paEtapa2:='13';
    ELSIF paSolicitud='CREDITO_WEB' AND  paDocumento = '247' THEN
      paEtapa2:='14';
    ELSE
      paEtapa2:='1';
    END IF;

   SELECT CATD.fiIdDocumento,CATD.fcDescDocumento
      INTO vlFildoc,vlDescdoc
      FROM DIGWEB.CATDOCUMENTOS CATD
      WHERE CATD.fiOpeDocumento = paCatODoc
      AND CATD.fiIdDocumento=paDocumento
      AND (CATD.FISUBPRODUCTO=1 OR CATD.FISUBPRODUCTO=2)
      --AND CATD.FIETAPA=1
          AND CATD.FIETAPA=paEtapa2
      GROUP BY CATD.fiIdDocumento,CATD.fcDescDocumento;

  END;
  ELSE
    BEGIN

     SELECT CATD.fiIdDocumento,CATD.fcDescDocumento
      INTO vlFildoc,vlDescdoc
      FROM DIGWEB.CATDOCUMENTOS CATD
      WHERE CATD.fiOpeDocumento = paCatODoc
      AND CATD.fiIdDocumento=paDocumento
        AND CATD.FISUBPRODUCTO=paSubproducto
            AND CATD.FIETAPA=paEtapa;

    END;
  END IF;

    SELECT IM.APPIMX,IM.EXPIMX
    INTO vlAppimx,vlExpimx
    FROM DIGWEB.IMX01 IM
    WHERE IM.APPIMX = paSolicitud
    AND IM.IMX01 = paCuenta;
     ----------OBTENEMOS CONSECUTIVO
    SELECT NVL(MAX(IM2.DOCIMX),0)+1
    INTO vlMaximo
    FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                            FROM DIGWEB.IMX01 IM
                            WHERE IM.APPIMX = paSolicitud
                            AND IM.IMX01 = paCuenta) IM1
    WHERE IM2.EXPIMX = IM1.EXPIMX
    AND IM1.APPIMX = IM2.APPIMX;





        INSERT INTO DIGWEB.IMX02 (APPIMX, EXPIMX, DOCIMX, IDDOCIMX, NOMDOCIMX, STATUSIMX, FISUBPRODUCTO, FIETAPA)
         VALUES( vlAppimx
                ,vlExpimx
                ,vlMaximo
                ,vlFildoc
                ,vlDescdoc
                ,1
                ,paSubproducto
                ,paEtapa
        --,vSubproducto,vEtapa
                );

  --------------------


   SELECT NVL(MAX(IM3.PAGIMX),0)+1
    INTO vlPagimx
    FROM DIGWEB.IMX03 IM3,(SELECT IM2.EXPIMX,IM2.DOCIMX,IM2.FISUBPRODUCTO,IM2.FIETAPA, IM2.APPIMX
                           FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                                   FROM DIGWEB.IMX01 IM
                                                   WHERE IM.APPIMX =paSolicitud
                                                   AND IM.IMX01 = paCuenta ) IM1
                           WHERE IM2.EXPIMX = IM1.EXPIMX
                           AND   IM2.APPIMX = IM1.APPIMX
                           AND IM2.IDDOCIMX = paDocumento
                           AND IM2.FISUBPRODUCTO=pasubproducto
                           AND IM2.FIETAPA=paetapa) IM4
    WHERE IM3.EXPIMX = IM4.EXPIMX
    AND IM3.APPIMX = IM4.APPIMX
    AND IM3.DOCIMX = IM4.DOCIMX
    AND IM3.FISUBPRODUCTO=IM4.FISUBPRODUCTO
    AND IM3.FIETAPA=IM4.FIETAPA;



        INSERT INTO DIGWEB.IMX03 (APPIMX, EXPIMX, DOCIMX, PAGIMX, IMGIMX, RUTIMX, STATUSIMX, FISUBPRODUCTO, FIETAPA, USUARIOIMX, WSIMX, FECDICIMX)
         VALUES( vlAppimx
                ,vlExpimx
                ,vlMaximo
                ,vlPagimx  --MAXIMO DEL DOCUMENTO
                ,CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlPagimx),4,0))),'.tiff')
                ,paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlPagimx),4,0))),'.tiff')
                ,1
                ,paSubproducto
                ,paEtapa
                --,vSubproducto,vEtapa
                ,pausuarioimx
                ,pawsimx
                ,SYSDATE);
        COMMIT;


        OPEN cCursorsalida FOR
          SELECT paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/' R1
                ,paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlPagimx),4,0))),'.tiff') R2 FROM DUAL;
        RETURN cCursorsalida;

  END IF;
END;
END;
/


--
-- TMPFNCLSWLS0001  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0001( paSolicitud  IN IMX01.appimx%TYPE--CAPTACION
                         ,paCuenta     IN DIGWEB.IMX01.imx01%TYPE--00120102010201
                         ,paCatODoc    IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                         ,paDocumento  IN DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                         ,paRutImg     IN DIGWEB.IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
RETURN  DIGWEB.PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: CREAD DOCUMENTO, AGREGA PAGINAS A DOCUMENTO Y CAMBIA EL ESTADO DEL EXPEDIENTE A M
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                       ,paCuenta IN IMX01.imx01%TYPE--00120102010201
                       ,paCatODoc IN CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                       ,paDocumento IN CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                       ,paImg IMX03.imgimx%TYPE--imagen.jpg
                       ,paRutImg IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida  DIGWEB.PATYPES.RCGCURSOR;
cTemp          PATYPES.RCGCURSOR;
vlBanderaD     NUMBER;
vlMaximo       NUMBER;
vlAppimx       DIGWEB.imx03.appimx%TYPE;
vlExpimx       DIGWEB.imx03.expimx%TYPE;
vlDocimx       DIGWEB.imx03.docimx%TYPE;
vlPagimx       NUMBER;
vlDescdoc      DIGWEB.CATDOCUMENTOS.fcdescdocumento%TYPE;
vlFildoc       DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE;
vlError        NUMBER;
vlCons         NUMBER; --CONSECUTIVO OBTENIDO
vlLongitud     NUMBER; --LOGITUD DEL IMX
vlMaximoF      NUMBER :=0; -- MAXIMO CONSECUTIVO
vlExiste       NUMBER; --EXISTEN REGISTROS CON FECHAS
vlMaximoR      NUMBER;
vlExpi         IMX03.expimx%TYPE;
vlImg          IMX03.imgimx%TYPE;

BEGIN
  BEGIN
     SELECT COUNT(1) INTO vlBanderaD
       FROM DIGWEB.IMX02 IM2,
           ( SELECT IM.APPIMX
                   ,IM.EXPIMX
               FROM DIGWEB.IMX01 IM
              WHERE IM.APPIMX =paSolicitud
                AND IM.IMX01 = paCuenta) IM1
              WHERE IM2.EXPIMX = IM1.EXPIMX
                AND IM2.IDDOCIMX = paDocumento
                AND IM2.APPIMX = paSolicitud;

                   IF vlBanderaD = 1 THEN
                   --EXSTE EL DOCUMENTO
                      SELECT MAX(IM3.PAGIMX)+1
                        INTO vlPagimx
                        FROM DIGWEB.IMX03 IM3
                            ,(SELECT IM2.EXPIMX
                                    ,IM2.DOCIMX
                                FROM DIGWEB.IMX02 IM2
                                    ,( SELECT IM.APPIMX
                                             ,IM.EXPIMX
                                         FROM DIGWEB.IMX01 IM
                                        WHERE IM.APPIMX =paSolicitud
                                          AND IM.IMX01 = paCuenta ) IM1
                                WHERE IM2.EXPIMX = IM1.EXPIMX
                                  AND IM2.IDDOCIMX = paDocumento
                                      ) IM4
                        WHERE IM3.EXPIMX = IM4.EXPIMX
                          AND IM3.DOCIMX = IM4.DOCIMX
                          AND IM3.APPIMX = paSolicitud;

                       SELECT
                     DISTINCT IM3.APPIMX
                             ,IM3.EXPIMX
                             ,IM3.DOCIMX
                         INTO vlAppimx
                             ,vlExpimx
                             ,vlDocimx
                         FROM DIGWEB.IMX03 IM3
                             ,( SELECT IM2.EXPIMX
                                      ,IM2.DOCIMX
                                  FROM DIGWEB.IMX02 IM2
                                      ,( SELECT IM.APPIMX
                                               ,IM.EXPIMX
                                           FROM DIGWEB.IMX01 IM
                                          WHERE IM.APPIMX = paSolicitud
                                            AND IM.IMX01 = paCuenta
                                       ) IM1
                                 WHERE IM2.EXPIMX = IM1.EXPIMX
                                   AND IM2.IDDOCIMX = paDocumento) IM4
                        WHERE IM3.EXPIMX = IM4.EXPIMX
                          AND IM3.DOCIMX = IM4.DOCIMX
                          AND IM3.APPIMX = paSolicitud;
                           ---VERIFICAMOS QUE EXISTA LA FECHA

                       SELECT COUNT(1)
                         INTO vlExiste
                         FROM DIGWEB.IMX03 IM3
                        WHERE IM3.rutimx
                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                            IF vlExiste > 0 THEN
                            --FECHA ACTUAL
                               OPEN cTemp FOR
                                  SELECT IM3.expimx
                                        ,IM3.imgimx
                                    INTO vlExiste,
                                         vlImg
                                    FROM DIGWEB.IMX03 IM3
                                   WHERE IM3.rutimx
                                    LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;
                                    LOOP
                                   FETCH cTemp INTO vlExpi,vlImg;
                                    EXIT WHEN cTemp%NOTFOUND;
                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                      IF vlCons > vlMaximoF THEN
                                         vlMaximoF := vlCons;
                                         vlMaximoR :=1 + vlMaximoF;
                                      END IF;
                                     END LOOP;
                               CLOSE cTemp;

                              INSERT
                                INTO DIGWEB.IMX03 (APPIMX, EXPIMX, DOCIMX, PAGIMX, IMGIMX, RUTIMX)
                              VALUES( vlAppimx
                                     ,vlExpimx
                                     ,vlDocimx
                                     ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                     ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                     ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                      COMMIT;
                                 OPEN cCursorsalida FOR
                                    SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                          ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                    RETURN cCursorsalida;
                            ELSE
                            --NO HAY FECHA ACTUAL VERIFICA SI HAY ANTETERIOR O NO HAY REGISTROS
                               SELECT COUNT(1)
                                 INTO vlExiste
                                 FROM DIGWEB.IMX03 IM3
                                WHERE IM3.rutimx
                                 LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                  IF vlExiste > 0 THEN

                                     OPEN cTemp FOR
                                        SELECT IM3.expimx
                                              ,IM3.imgimx
                                          INTO vlExiste,
                                                 vlImg
                                          FROM DIGWEB.IMX03 IM3
                                         WHERE IM3.rutimx
                                          LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;

                                          LOOP
                                             FETCH cTemp INTO vlExpi
                                                             ,vlImg;
                                              EXIT WHEN cTemp%NOTFOUND;
                                                   vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                   vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                IF vlCons > vlMaximoF THEN
                                                   vlMaximoF := vlCons;
                                                   vlMaximoR :=1 + vlMaximoF;
                                               END IF;
                                          END LOOP;
                                     CLOSE cTemp;

                                    INSERT
                                      INTO DIGWEB.IMX03 (APPIMX, EXPIMX, DOCIMX, PAGIMX, IMGIMX, RUTIMX)
                                    VALUES( vlAppimx
                                           ,vlExpimx
                                           ,vlDocimx
                                           ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                           ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                           ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                            COMMIT;
                                       OPEN cCursorsalida FOR
                                          SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                                ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                       RETURN cCursorsalida;
                                  ELSE
                                  --NO EXISTEN REGISTROS PONEMOS EL PRIMER CONSECUTIVO
                                     INSERT
                                       INTO DIGWEB.IMX03 (APPIMX, EXPIMX, DOCIMX, PAGIMX, IMGIMX, RUTIMX)
                                     VALUES( vlAppimx
                                            ,vlExpimx
                                            ,vlDocimx
                                            ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                            ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                            ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                             COMMIT;
                                        OPEN cCursorsalida FOR
                                           SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                                 ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff') R2 FROM DUAL;
                                           RETURN cCursorsalida;
                                  END IF;
                            END IF;
                                     COMMIT;

                   ELSE
                   --NO EXISTE EL DOCUMENTO
                      SELECT CATD.fiIdDocumento
                            ,CATD.fcDescDocumento
                        INTO vlFildoc
                            ,vlDescdoc
                        FROM DIGWEB.CATDocumentos CATD
                       WHERE CATD.fiOpeDocumento = paCatODoc
                         AND CATD.fiIdDocumento=paDocumento;

                      SELECT IM.APPIMX
                            ,IM.EXPIMX
                        INTO vlAppimx
                            ,vlExpimx
                        FROM DIGWEB.IMX01 IM
                       WHERE IM.APPIMX = paSolicitud
                         AND IM.IMX01 = paCuenta;
                   ----------OBTENEMOS CONSECUTIVO
                      SELECT MAX(IM2.DOCIMX)+1
                        INTO vlMaximo
                        FROM DIGWEB.IMX02 IM2
                            ,( SELECT IM.APPIMX
                                     ,IM.EXPIMX
                                 FROM DIGWEB.IMX01 IM
                                WHERE IM.APPIMX = paSolicitud
                                  AND IM.IMX01 = paCuenta
                             ) IM1
                       WHERE IM2.EXPIMX = IM1.EXPIMX
                         AND IM1.APPIMX = IM2.APPIMX;

                          IF vlMaximo IS NOT NULL THEN
                             INSERT
                               INTO DIGWEB.IMX02 (APPIMX, EXPIMX, DOCIMX,IDDOCIMX,NOMDOCIMX)
                             VALUES( vlAppimx
                                    ,vlExpimx
                                    ,vlMaximo
                                    ,vlFildoc
                                    ,vlDescdoc);

                             SELECT COUNT(1)
                               INTO vlExiste
                               FROM DIGWEB.IMX03 IM3
                              WHERE IM3.rutimx
                               LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                                 IF vlExiste > 0 THEN
                                    --FECHA ACTUAL
                                    OPEN cTemp FOR
                                       SELECT IM3.expimx
                                             ,IM3.imgimx
                                         INTO vlExiste,
                                               vlImg
                                         FROM DIGWEB.IMX03 IM3
                                        WHERE IM3.rutimx
                                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;
                                         LOOP
                                            FETCH cTemp INTO vlExpi,vlImg;
                                             EXIT WHEN cTemp%NOTFOUND;
                                                  vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                  vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                               IF vlCons > vlMaximoF THEN
                                                  vlMaximoF := vlCons;
                                                  vlMaximoR :=1 + vlMaximoF;
                                              END IF;
                                         END LOOP;
                                    CLOSE cTemp;

                                   INSERT
                                     INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                   VALUES( vlAppimx
                                          ,vlExpimx
                                          ,vlMaximo
                                          ,1  --MAXIMO DEL DOCUMENTO
                                          ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                          ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                           COMMIT;
                                      OPEN cCursorsalida FOR
                                         SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                               ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                      RETURN cCursorsalida;

                                 ELSE
                                 --NO HAY EFCHA ACTUAL VERIFICAR SI HAY FECHA ANTERIOR O NO HAY REGISTROS
                                    SELECT COUNT(1)
                                      INTO vlExiste
                                      FROM DIGWEB.IMX03 IM3
                                     WHERE IM3.rutimx
                                      LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                        IF vlExiste > 0 THEN
                                           OPEN cTemp FOR
                                              SELECT IM3.expimx
                                                    ,IM3.imgimx
                                                INTO vlExiste,
                                                     vlImg
                                                FROM DIGWEB.IMX03 IM3
                                               WHERE IM3.rutimx
                                                LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;
                                                LOOP
                                                   FETCH cTemp INTO vlExpi
                                                                   ,vlImg;
                                                    EXIT WHEN cTemp%NOTFOUND;
                                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                      IF vlCons > vlMaximoF THEN
                                                         vlMaximoF := vlCons;
                                                         vlMaximoR :=1 + vlMaximoF;
                                                     END IF;
                                                END LOOP;
                                           CLOSE cTemp;

                                          INSERT
                                            INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                          VALUES( vlAppimx
                                                 ,vlExpimx
                                                 ,vlMaximo
                                                 ,1  --MAXIMO DEL DOCUMENTO
                                                 ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                                 ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                                  COMMIT;
                                             OPEN cCursorsalida FOR
                                                SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                                      ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                             RETURN cCursorsalida;
                                        ELSE
                                           INSERT
                                             INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                           VALUES( vlAppimx
                                                  ,vlExpimx
                                                  ,vlMaximo
                                                  ,1  --MAXIMO DEL DOCUMENTO
                                                  ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                                  ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                                   COMMIT;
                                              OPEN cCursorsalida FOR
                                                 SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                                       ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoF),'.tiff') R2 FROM DUAL;
                                              RETURN cCursorsalida;
                                        END IF;
                                 END IF;

                          ELSE
                             INSERT
                              INTO DIGWEB.IMX02 (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX)
                            VALUES( vlAppimx
                                   ,vlExpimx
                                   ,0
                                   ,vlFildoc
                                   ,vlDescdoc);

                             SELECT COUNT(1)
                               INTO vlExiste
                               FROM DIGWEB.IMX03 IM3
                              WHERE IM3.rutimx
                               LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                                 IF vlExiste > 0 THEN
                                 -- HAY FECHA ACTUAL
                                    OPEN cTemp FOR
                                       SELECT IM3.expimx
                                             ,IM3.imgimx
                                         INTO vlExiste,
                                               vlImg
                                         FROM DIGWEB.IMX03 IM3
                                        WHERE IM3.rutimx
                                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;

                                         LOOP
                                            FETCH cTemp INTO vlExpi
                                                            ,vlImg;
                                             EXIT WHEN cTemp%NOTFOUND;
                                                  vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                  vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                               IF vlCons > vlMaximoF THEN
                                                  vlMaximoF := vlCons;
                                                  vlMaximoR :=1 + vlMaximoF;
                                              END IF;
                                         END LOOP;
                                    CLOSE cTemp;

                                   INSERT
                                     INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                   VALUES( vlAppimx
                                          ,vlExpimx
                                          ,0
                                          ,1  --MAXIMO DEL DOCUMENTO
                                          ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                          ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                           COMMIT;
                                      OPEN cCursorsalida FOR
                                         SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                               ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                      RETURN cCursorsalida;
                                 ELSE
                                 --NO HAY EFCHA ACTUAL VERIFICAR SI HAY FECHA ANTERIOR O NO HAY REGISTROS
                                    SELECT COUNT(1)
                                      INTO vlExiste
                                      FROM DIGWEB.IMX03 IM3
                                     WHERE IM3.rutimx
                                      LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                        IF vlExiste > 0 THEN
                                           --EXITE FECHA ABNTERIOR
                                           OPEN cTemp FOR
                                              SELECT IM3.expimx
                                                    ,IM3.imgimx
                                                INTO vlExiste,
                                                     vlImg
                                                FROM DIGWEB.IMX03 IM3
                                               WHERE IM3.rutimx
                                                LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;
                                                LOOP
                                                   FETCH cTemp INTO vlExpi
                                                                   ,vlImg;
                                                    EXIT WHEN cTemp%NOTFOUND;
                                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                      IF vlCons > vlMaximoF THEN
                                                         vlMaximoF := vlCons;
                                                         vlMaximoR :=1 + vlMaximoF;
                                                     END IF;
                                                END LOOP;
                                           CLOSE cTemp;

                                          INSERT
                                            INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                          VALUES( vlAppimx
                                                 ,vlExpimx
                                                 ,0
                                                 ,1  --MAXIMO DEL DOCUMENTO
                                                 ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                                 ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                                  COMMIT;
                                             OPEN cCursorsalida FOR
                                                SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                                      ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                             RETURN cCursorsalida;
                                        ELSE
                                        --NO EXISTEN REGISTROS
                                           INSERT
                                             INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                           VALUES( vlAppimx
                                                  ,vlExpimx
                                                  ,0
                                                  ,1  --MAXIMO DEL DOCUMENTO
                                                  ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                                  ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                                   COMMIT;
                                              OPEN cCursorsalida FOR
                                            SELECT paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\' R1
                                                  ,paRutImg||paSolicitud||'\'||TO_CHAR(SYSDATE,'DDMMYY')||'\'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff') R2 FROM DUAL;
                                            RETURN cCursorsalida;
                                         END IF;
                                 END IF;
                          END IF;
                   END IF;
                      EXCEPTION
                           WHEN OTHERS THEN
                          BEGIN
                                vlError := 1;
                            END;
                      END;

                       IF vlError = 1 THEN
                          ROLLBACK;
                              OPEN cCursorsalida FOR
                                 SELECT 'ERROR' MSG FROM DUAL;
                              RETURN cCursorsalida;
                       END IF;

EXCEPTION
 WHEN OTHERS
   THEN NULL;
END;
/


--
-- TMPFNCLSWLS0002  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.tmpfnclswls0002( paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                         ,paCuenta    IN DIGWEB.IMX01.imx01%TYPE--00120102010201
                         ,paIMX02     IN DIGWEB.IMX01.imx02%TYPE--nombre
                         ,paIMX03     IN DIGWEB.IMX01.imx03%TYPE--Canal Elektra
                         ,paIMX04     IN DIGWEB.IMX01.imx04%TYPE--Departamento (La regional)
                         ,paIMX05     IN DIGWEB.IMX01.imx05%TYPE--Solicitud
                         ,paIMX06     IN DIGWEB.IMX01.imx06%TYPE--IDopedoc
                         ,paIMX09     IN DIGWEB.IMX01.imx09%TYPE--Modulo
                         ,paIMX11     IN DIGWEB.IMX01.imx11%TYPE--nombre
                         ,paIMX12     IN DIGWEB.IMX01.imx12%TYPE--Canal Elektra
                         ,paIMX13     IN DIGWEB.IMX01.imx13%TYPE--Canal Elektra
                         ,paIMX14     IN DIGWEB.IMX01.imx14%TYPE--Departamento (La regional)
                         ,paIMX15     IN DIGWEB.IMX01.imx15%TYPE--Solicitud
                         ,paIMX16     IN DIGWEB.IMX01.imx16%TYPE--IDopedoc
                         )
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: CREA EXPEDIENTE CON ESTADO N
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta IN IMX01.imx01%TYPE--00120102010201
                          ,paIMX02 IN IMX01.imx02%TYPE
                          ,paIMX03 IN IMX01.imx03%TYPE
                          ,paIMX04 IN IMX01.imx04%TYPE
                          ,paIMX05 IN IMX01.imx05%TYPE
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
cCursorMsg     PATYPES.RCGCURSOR;
vlMaximo       NUMBER;
vlExiste       NUMBER;
vlException    NUMBER;
BEGIN
   IF NVL(paSolicitud,'0') = '0' AND NVL(paCuenta,'0') = '0' THEN
      OPEN cCursorMsg FOR
            SELECT 'PARAMETROS INCORRECTOS' MSG
              FROM DUAL;
           RETURN cCursorMsg;
   ELSE

    BEGIN
    SELECT COUNT(1) INTO vlExiste
      FROM DIGWEB.IMX01 IM
     WHERE IM.APPIMX = paSolicitud
       AND IM.IMX01 = paCuenta;
    END;

        IF vlExiste = 0 THEN
           SELECT MAX(IM.EXPIMX)+1 INTO vlMaximo
             FROM DIGWEB.IMX01 IM
            WHERE IM.APPIMX = paSolicitud;

            IF vlMaximo IS NULL THEN
               vlMaximo:= 1;
            END IF;

               INSERT INTO DIGWEB.IMX01( APPIMX
                                 ,EXPIMX
                                 ,USOIMX
                                 ,EDOIMX
                                 ,IMX01
                                 ,IMX02
                                 ,IMX03
                                 ,IMX04
                                 ,IMX05
                                 ,IMX06
                                 ,IMX07
                                 ,IMX08
                                 ,IMX09
                                 ,IMX10
                                 ,IMX11
                                 ,IMX12
                                 ,IMX13
                                 ,IMX14
                                 ,IMX15
                                 ,IMX16
                                 )
                          VALUES ( paSolicitud
                                  ,vlMaximo
                                  ,0
                                  ,'N'
                                  ,paCuenta
                                  ,paIMX02
                                  ,paIMX03
                                  ,paIMX04
                                  ,paIMX05
                                  ,paIMX06
                                  ,''
                                  ,TO_CHAR(SYSDATE,'YYMMDDHH24MMSS')
                                  ,paIMX09
                                  ,''
                                  ,paIMX11
                                  ,paIMX12
                                  ,paIMX13
                                  ,paIMX14
                                  ,paIMX15
                                  ,paIMX16

                                  );
                          COMMIT;

                             OPEN cCursorMsg FOR
                                SELECT 'EXPEDIENTE CREADO' MSG
                                FROM DUAL;
                             RETURN cCursorMsg;
          ELSE
           OPEN cCursorMsg FOR
              SELECT 'ERROR' MSG
              FROM DUAL;
           RETURN cCursorMsg;
        END IF;

   END IF;


EXCEPTION
    WHEN OTHERS THEN
      NULL;
END;
/


--
-- TMPFNCLSWLS0003  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0003 ( paSolicitud  IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta     IN IMX01.imx01%TYPE --00120102010201
                          ,paDocumento  IN IMX02.iddocimx%TYPE--2, 510,1,33
                          ,paPagina     IN IMX03.pagimx%TYPE) --1,2,3,4 ETC.
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: ELIMINA PAGINA DE UN DOCUMENTO
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN IMX02.iddocimx%TYPE--2, 510,1,33
                      ,paPagina IN IMX03.pagimx%TYPE--1,2,3,4 ETC.
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
crTemp PATYPES.RCGCURSOR;
--CURSOR C IS SELECT PAGIMX FROM IMX03 WHERE APPIMX= paSolicitud AND EXPIMX = vlCons AND DOCIMX = vlDoc ORDER BY  PAGIMX ASC;
PAGNUM         NUMBER;
CONT           NUMBER := 1;
vlCons         IMX01.expimx%TYPE;
vlDoc          NUMBER;
vlCont         NUMBER;
vlException    NUMBER;
BEGIN
   BEGIN
   SELECT IM.expimx INTO vlCons
     FROM IMX01 IM
    WHERE IM.APPIMX = paSolicitud
      AND IM.IMX01 = paCuenta;

         SELECT IM2.DOCIMX INTO vlDoc
           FROM IMX02 IM2
               ,( SELECT IM.APPIMX
                        ,IM.EXPIMX
                    FROM IMX01 IM
                   WHERE IM.APPIMX = paSolicitud
                     AND IM.IMX01 = paCuenta ) IM1
                   WHERE IM2.EXPIMX = IM1.EXPIMX
                     AND IM2.IDDOCIMX = paDocumento
                     AND IM2.APPIMX = paSolicitud;

                        DELETE
                          FROM IMX03 IM3
                         WHERE IM3.APPIMX = paSolicitud
                           AND IM3.expimx = vlCons
                           AND IM3.docimx = vlDoc
                           AND IM3.pagimx = paPagina;

                           SELECT COUNT(1) INTO vlCont
                             FROM IMX03 IM3
                            WHERE IM3.APPIMX = paSolicitud
                              AND IM3.EXPIMX = vlCons
                              AND IM3.DOCIMX = vlDoc;

                                 IF vlCont = 0 THEN
                                    DELETE
                                      FROM IMX02 IM2
                                     WHERE IM2.APPIMX = paSolicitud
                                       AND IM2.EXPIMX = vlCons
                                       AND IM2.DOCIMX = vlDoc;
                                    COMMIT;

                                       SELECT COUNT(1) INTO vlCont
                                         FROM IMX02 IM2
                                        WHERE IM2.APPIMX = paSolicitud
                                          AND IM2.EXPIMX = vlCons;

                                       IF vlCont = 0 THEN
                                                UPDATE DIGWEB.IMX01 IM
                                                   SET IM.EDOIMX = 'N'
                                                 WHERE IM.APPIMX = paSolicitud
                                                   AND IM.IMX01 = paCuenta;
                                       END IF;
                                ELSE
                                 OPEN crTemp FOR SELECT PAGIMX FROM IMX03 WHERE APPIMX= paSolicitud AND EXPIMX = vlCons AND DOCIMX = vlDoc ORDER BY  PAGIMX ASC;

                                                --OPEN crTemp;
                                                LOOP
                                                   FETCH crTemp INTO PAGNUM;
                                                    EXIT WHEN crTemp%NOTFOUND;
                                                 IF PAGNUM = 1 THEN
                                                     CONT := 2;
                                                        ELSE
                                                   UPDATE IMX03
                                                      SET PAGIMX = CONT
                                                    WHERE APPIMX = paSolicitud AND EXPIMX = vlCons AND DOCIMX = vlDoc AND PAGIMX = PAGNUM;
                                                         CONT:=CONT+1;
                                                         COMMIT;
                                                       END IF;
                                                       END LOOP;
                                                       CLOSE crTemp;


                                END IF;
                                   EXCEPTION WHEN OTHERS THEN
                                   BEGIN
                                     vlException := 1;
                                   END;
                                   END;

                                   IF vlException = 1 THEN
                                   ROLLBACK;
                                      OPEN cCursorsalida FOR
                                         SELECT 'DATOS NO EXISTENTES' MSG FROM DUAL;
                                      RETURN cCursorsalida;
                                   ELSE
                                   COMMIT;
                                      OPEN cCursorsalida FOR
                                         SELECT 'PAGINA ELIMINADA' MSG FROM DUAL;
                                      RETURN cCursorsalida;
                                   END IF;


EXCEPTION
   WHEN OTHERS THEN
   NULL;
END;
/


--
-- TMPFNCLSWLS0004  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0004 ( paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta    IN IMX01.imx01%TYPE --00120102010201
                          ,paDocumento IN IMX02.iddocimx%TYPE) --2, 510,1,33
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: ELIMINA DOCUMENTO CON TODAS SUS PAGINAS
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN IMX02.iddocimx%TYPE--2, 510,1,33
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
vlCons         IMX01.expimx%TYPE;
vlDoc          NUMBER;
vlCont         NUMBER;
vlError        NUMBER;
BEGIN
   BEGIN
      SELECT IM.expimx
        INTO vlCons
        FROM IMX01 IM
       WHERE IM.APPIMX = paSolicitud
         AND IM.IMX01 = paCuenta;

            SELECT IM2.DOCIMX
              INTO vlDoc
              FROM IMX02 IM2
                  ,( SELECT IM.APPIMX
                           ,IM.EXPIMX
                       FROM IMX01 IM
                      WHERE IM.APPIMX = paSolicitud
                        AND IM.IMX01 = paCuenta ) IM1
                      WHERE IM2.EXPIMX = IM1.EXPIMX
                        AND IM2.IDDOCIMX = paDocumento
                        AND IM2.APPIMX = paSolicitud;

                           DELETE
                             FROM IMX03 IM3
                            WHERE IM3.APPIMX= paSolicitud
                              AND IM3.expimx = vlCons
                              AND IM3.docimx = vlDoc;

                                 DELETE
                                   FROM IMX02 IM2
                                  WHERE IM2.APPIMX = paSolicitud
                                    AND IM2.expimx = vlCons
                                    AND IM2.iddocimx = paDocumento;
                                 --COMMIT;

                                    SELECT COUNT(1)
                                      INTO vlCont
                                      FROM IMX02 IM2
                                     WHERE IM2.APPIMX = paSolicitud
                                       AND IM2.EXPIMX = vlCons;

                                          IF vlCont = 0 THEN
                                             UPDATE DIGWEB.IMX01 IM
                                                SET IM.EDOIMX = 'N'
                                              WHERE IM.APPIMX = paSolicitud
                                                AND IM.IMX01 = paCuenta;
                                           --  COMMIT;
                                          END IF;
                                             EXCEPTION WHEN NO_DATA_FOUND THEN
                                                BEGIN
                                                   vlError := 1;
                                                END;
   END;

      IF vlError = 1 THEN
      ROLLBACK;
         OPEN cCursorsalida FOR
            SELECT 'ERROR EN ELIMINACION' MSG
            FROM DUAL;
                                         RETURN cCursorsalida;
                                      ELSE
                                      COMMIT;
                                      OPEN cCursorsalida FOR
                                         SELECT 'DOCUMENTO ELIMINADO' MSG
                                           FROM DUAL;
                                         RETURN cCursorsalida;
                                      END IF;



--EXCEPTION
 --    WHEN OTHERS THEN
   --  NULL;
END;
/


--
-- TMPFNCLSWLS0004JA  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0004JA( paSolicitud     IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta         IN IMX01.imx01%TYPE --00120102010201
                          ,paDocumento      IN IMX02.iddocimx%TYPE
                          ,pausuarioimx     IN IMX02.STATUSIMX%TYPE
                          ,pawsimx          IN IMX03.WSIMX%TYPE
                          ,pasubproducto  IN CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                          ,paetapa        IN CATDOCUMENTOS.FIETAPA%TYPE) --2, 510,1,33
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: Actualiza y cambiar statusimx a 0 los de los documentos como si se
             ELIMINA DOCUMENTO CON TODAS SUS PAGINAS
Par metros de entrada: paSolicitud IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN DIGWEB.IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN DIGWEB.IMX02.iddocimx%TYPE--2, 510,1,33
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: JOSÉ ALFREDO ORTEGA HERNÁNDEZ
Fecha: 26-ABR-2007
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
vlCons         IMX01.expimx%TYPE;
vlDoc          NUMBER;
vlCont         NUMBER;
vlError        NUMBER;
BEGIN

  BEGIN
   SELECT IM.expimx
    INTO vlCons
    FROM IMX01 IM
    WHERE IM.APPIMX = paSolicitud
    AND IM.IMX01 = paCuenta;



IF paSolicitud='CREDITO_WEB' THEN

BEGIN


    SELECT IM2.DOCIMX
     INTO vlDoc
     FROM IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                       FROM IMX01 IM
                       WHERE IM.APPIMX = paSolicitud
                       AND IM.IMX01 = paCuenta) IM1
     WHERE IM2.EXPIMX = IM1.EXPIMX
     AND IM2.IDDOCIMX = paDocumento
     AND IM2.APPIMX = paSolicitud
     --AND IM2.fisubproducto=pasubproducto
     AND (IM2.fisubproducto='1' OR  IM2.fisubproducto='2')

     AND IM2.fietapa=paetapa;

        UPDATE IMX03 IM3
         SET IM3.STATUSIMX =0,
             IM3.USUARIOIMX= pausuarioimx,
             IM3.WSIMX=pawsimx,
             IM3.FECDICIMX=SYSDATE
         WHERE IM3.APPIMX= paSolicitud
         AND IM3.expimx = vlCons
         AND IM3.docimx = vlDoc
         --AND IM3.fisubproducto=pasubproducto
         AND (IM3.fisubproducto='1' OR  IM3.fisubproducto='2')
         AND IM3.fietapa=paetapa;

         UPDATE IMX02 IM2
          SET  IM2.STATUSIMX =0
          WHERE IM2.APPIMX = paSolicitud
          AND IM2.expimx = vlCons
          AND IM2.iddocimx = paDocumento
          --AND IM2.fisubproducto=pasubproducto
          AND (IM2.fisubproducto='1' OR  IM2.fisubproducto='2')
          AND IM2.fietapa=paetapa;
                                 --COMMIT;

             SELECT COUNT(1)
              INTO vlCont
              FROM IMX02 IM2
              WHERE IM2.APPIMX = paSolicitud
              AND IM2.EXPIMX = vlCons
              AND im2.fietapa=paetapa
              --AND im2.fisubproducto=pasubproducto
              AND (IM2.fisubproducto='1' OR  IM2.fisubproducto='2')
              AND im2.statusimx=1;

                                  END;

                                  ELSE

                                  BEGIN

                  SELECT IM2.DOCIMX
     INTO vlDoc
     FROM IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                       FROM IMX01 IM
                       WHERE IM.APPIMX = paSolicitud
                       AND IM.IMX01 = paCuenta) IM1
     WHERE IM2.EXPIMX = IM1.EXPIMX
     AND IM2.IDDOCIMX = paDocumento
     AND IM2.APPIMX = paSolicitud
     AND IM2.fisubproducto=pasubproducto
     AND IM2.fietapa=paetapa;

        UPDATE IMX03 IM3
         SET IM3.STATUSIMX =0,
             IM3.USUARIOIMX= pausuarioimx,
             IM3.WSIMX=pawsimx,
             IM3.FECDICIMX=SYSDATE
         WHERE IM3.APPIMX= paSolicitud
         AND IM3.expimx = vlCons
         AND IM3.docimx = vlDoc
         AND IM3.fisubproducto=pasubproducto
         AND IM3.fietapa=paetapa;

         UPDATE IMX02 IM2
          SET  IM2.STATUSIMX =0
          WHERE IM2.APPIMX = paSolicitud
          AND IM2.expimx = vlCons
          AND IM2.iddocimx = paDocumento
          AND IM2.fisubproducto=pasubproducto
          AND IM2.fietapa=paetapa;
                                 --COMMIT;

             SELECT COUNT(1)
              INTO vlCont
              FROM IMX02 IM2
              WHERE IM2.APPIMX = paSolicitud
              AND IM2.EXPIMX = vlCons
              AND im2.fietapa=paetapa
              AND im2.fisubproducto=pasubproducto
              AND im2.statusimx=1;




                                  END;

                                  END IF;

                      IF vlCont = 0 THEN
                           UPDATE IMX01 IM
                              SET IM.EDOIMX = 'N'
                            WHERE IM.APPIMX = paSolicitud
                              AND IM.IMX01 = paCuenta;
                                           --  COMMIT;
                      END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN

 BEGIN
   vlError := 1;
 END;
 END;

    IF vlError = 1 THEN
      ROLLBACK;
       OPEN cCursorsalida FOR
            SELECT 'E' MSG
            FROM DUAL;
      RETURN cCursorsalida;
    ELSE
     COMMIT;
       OPEN cCursorsalida FOR
        SELECT ' ' MSG
         FROM DUAL;
         RETURN cCursorsalida;
        END IF;


END;
/


--
-- TMPFNCLSWLS0004JAB  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0004JAB( paSolicitud     IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta         IN IMX01.imx01%TYPE --00120102010201
                          ,paDocumento      IN IMX02.iddocimx%TYPE
                          ,pausuarioimx     IN IMX03.USUARIOIMX%TYPE
                          ,pawsimx          IN IMX03.WSIMX%TYPE
                          ,pasubproducto    IN CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                          ,paetapa            IN CATDOCUMENTOS.FIETAPA%TYPE
                          ,panumpag         NUMBER
                          ,panamepag        IN IMX03.IMGIMX%TYPE
                          ,parutapag        IN IMX03.RUTIMX%TYPE)--nimero de pagina a ser sctualizado a 0
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:DIGITALIZACION WEB
Descripcion: CAMBIA ESTATUS DE PAGINA DEL DOCUMENTO
Par metros de entrada: paSolicitud IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN DIGWEB.IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN DIGWEB.IMX02.iddocimx%TYPE--2, 510,1,33
                      ,pausuarioimx     IN DIGWEB.IMX02.STATUSIMX%TYPE
                      ,pawsimx          IN DIGWEB.IMX03.WSIMX%TYPE
                      ,pasubproducto    IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                      ,paetapa            IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE
                      ,panumpag         NUMBER)--nimero de pagina a ser sctualizado a 0

Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: JOSE ALFREDO ORTEGA HERNANDEZ (SINERGY SOLUTIONS)
Fecha: 03-MAY-2007
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
vlCons         IMX01.expimx%TYPE;
vlDoc          NUMBER;
vlCont         NUMBER;
vlError        NUMBER;
v_countpg      NUMBER;
vlpag        NUMBER;
BEGIN
   BEGIN
     SELECT IM.expimx
      INTO vlCons
     FROM IMX01 IM
     WHERE IM.APPIMX = paSolicitud
     AND IM.IMX01 = paCuenta;



IF paSolicitud='CREDITO_WEB' THEN
  BEGIN

     SELECT IM2.DOCIMX
      INTO vlDoc
     FROM IMX02 IM2,( SELECT IM.APPIMX, IM.EXPIMX
                             FROM IMX01 IM
                             WHERE IM.APPIMX = paSolicitud
                             AND IM.IMX01 = paCuenta) IM1
     WHERE IM2.EXPIMX = IM1.EXPIMX
     AND IM2.IDDOCIMX = paDocumento
     AND IM2.APPIMX = paSolicitud
     --AND IM2.fisubproducto=pasubproducto
     AND (IM2.fisubproducto='1' OR IM2.fisubproducto='2')
     AND IM2.fietapa=paetapa
     AND IM2.statusimx=1;

     SELECT  RR.PAGIMX
          INTO vlpag
          FROM (
        SELECT ROWNUM lista, IM3.*
        FROM IMX03 IM3
            WHERE IM3.APPIMX= paSolicitud
            AND IM3.expimx = vlCons
            AND IM3.docimx = vlDoc
            --AND IM3.fisubproducto=pasubproducto
            AND (IM3.fisubproducto='1' OR IM3.fisubproducto='2')
            AND IM3.fietapa=paetapa
            AND IM3.STATUSIMX=1
            ORDER BY IM3.PAGIMX) RR
            WHERE RR.lista = panumpag;



         UPDATE IMX03 IM3
            SET IM3.STATUSIMX =0,
                IM3.USUARIOIMX= pausuarioimx,
                IM3.WSIMX=pawsimx,
                IM3.IMGIMX=panamepag,
                IM3.RUTIMX=parutapag,
                IM3.FECDICIMX=SYSDATE
          WHERE IM3.APPIMX= paSolicitud
            AND IM3.expimx = vlCons
            AND IM3.docimx = vlDoc
            --AND IM3.fisubproducto=pasubproducto
            AND (IM3.fisubproducto='1' OR IM3.fisubproducto='2')
            AND IM3.fietapa=paetapa
            AND IM3.PAGIMX=vlpag; --parametro que indica el nomero de pagina para cambiar estatutus

            --contador que indica cuantas paginas quedan en estatus 1 y si es cero realizar lactualizacion
          SELECT COUNT(1)
          INTO v_countpg
          FROM IMX03 IM3
          WHERE IM3.APPIMX= paSolicitud
            AND IM3.expimx = vlCons
            AND IM3.docimx = vlDoc
            --AND IM3.fisubproducto=pasubproducto
            AND (IM3.fisubproducto='1' OR IM3.fisubproducto='2')
            AND IM3.fietapa=paetapa
            AND IM3.STATUSIMX=1;

            IF v_countpg=0 THEN

               UPDATE IMX02 IM2
                 SET  IM2.STATUSIMX =0
               WHERE IM2.APPIMX = paSolicitud
                 AND IM2.expimx = vlCons
                 AND IM2.iddocimx = paDocumento
                 --AND IM2.fisubproducto=pasubproducto
                 AND (IM2.fisubproducto='1' OR IM2.fisubproducto='2')
                 AND IM2.fietapa=paetapa;
              --COMMIT;

               SELECT COUNT(1)
                INTO vlCont
               FROM IMX02 IM2
               WHERE IM2.APPIMX = paSolicitud
               AND IM2.EXPIMX = vlCons
               AND im2.fietapa=paetapa
               --AND im2.fisubproducto=pasubproducto
               AND (IM2.fisubproducto='1' OR IM2.fisubproducto='2')
               AND im2.statusimx=1;

                 IF vlCont = 0 THEN
                     UPDATE IMX01 IM
                        SET IM.EDOIMX = 'N'
                      WHERE IM.APPIMX = paSolicitud
                        AND IM.IMX01 = paCuenta;
                     --COMMIT;
                 END IF;
            END IF;

        END;
    ELSE


    BEGIN




     SELECT IM2.DOCIMX
     INTO vlDoc
     FROM IMX02 IM2,( SELECT IM.APPIMX, IM.EXPIMX
                             FROM IMX01 IM
                             WHERE IM.APPIMX = paSolicitud
                             AND IM.IMX01 = paCuenta) IM1
     WHERE IM2.EXPIMX = IM1.EXPIMX
     AND IM2.IDDOCIMX = paDocumento
     AND IM2.APPIMX = paSolicitud
     AND IM2.fisubproducto=pasubproducto
     AND IM2.fietapa=paetapa
     AND IM2.statusimx=1;

     SELECT  RR.PAGIMX
          INTO vlpag
          FROM (
        SELECT ROWNUM lista, IM3.*
        FROM IMX03 IM3
            WHERE IM3.APPIMX= paSolicitud
            AND IM3.expimx = vlCons
            AND IM3.docimx = vlDoc
            AND IM3.fisubproducto=pasubproducto
            AND IM3.fietapa=paetapa
            AND IM3.STATUSIMX=1
            ORDER BY IM3.PAGIMX) RR
            WHERE RR.lista = panumpag;



         UPDATE IMX03 IM3
            SET IM3.STATUSIMX =0,
                IM3.USUARIOIMX= pausuarioimx,
                IM3.WSIMX=pawsimx,
                IM3.IMGIMX=panamepag,
                IM3.RUTIMX=parutapag,
                IM3.FECDICIMX=SYSDATE
          WHERE IM3.APPIMX= paSolicitud
            AND IM3.expimx = vlCons
            AND IM3.docimx = vlDoc
            AND IM3.fisubproducto=pasubproducto
            AND IM3.fietapa=paetapa
            AND IM3.PAGIMX=vlpag; --parametro que indica el nomero de pagina para cambiar estatutus

            --contador que indica cuantas paginas quedan en estatus 1 y si es cero realizar lactualizacion
          SELECT COUNT(1)
          INTO v_countpg
          FROM IMX03 IM3
          WHERE IM3.APPIMX= paSolicitud
            AND IM3.expimx = vlCons
            AND IM3.docimx = vlDoc
            AND IM3.fisubproducto=pasubproducto
            AND IM3.fietapa=paetapa
            AND IM3.STATUSIMX=1;

            IF v_countpg=0 THEN

               UPDATE IMX02 IM2
                 SET  IM2.STATUSIMX =0
               WHERE IM2.APPIMX = paSolicitud
                 AND IM2.expimx = vlCons
                 AND IM2.iddocimx = paDocumento
                 AND IM2.fisubproducto=pasubproducto
                 AND IM2.fietapa=paetapa;
              --COMMIT;

               SELECT COUNT(1)
                INTO vlCont
               FROM IMX02 IM2
               WHERE IM2.APPIMX = paSolicitud
               AND IM2.EXPIMX = vlCons
               AND im2.fietapa=paetapa
               AND im2.fisubproducto=pasubproducto
               AND im2.statusimx=1;

                 IF vlCont = 0 THEN
                     UPDATE IMX01 IM
                        SET IM.EDOIMX = 'N'
                      WHERE IM.APPIMX = paSolicitud
                        AND IM.IMX01 = paCuenta;
                     --COMMIT;
                 END IF;
            END IF;



    END;
    END IF;

EXCEPTION WHEN NO_DATA_FOUND THEN

 BEGIN
  vlError := 1;
 END;
   END;

    IF vlError = 1 THEN
      ROLLBACK;
       OPEN cCursorsalida FOR
         SELECT 'E' MSG
          FROM DUAL;
       RETURN cCursorsalida;
    ELSE
     COMMIT;
       OPEN cCursorsalida FOR
        SELECT ' ' MSG
         FROM DUAL;
         RETURN cCursorsalida;
    END IF;


END;
/


--
-- TMPFNCLSWLS0004JAC  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0004JAC( paSolicitud     IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta         IN DIGWEB.IMX01.imx01%TYPE
                          ,paDocumento      IN DIGWEB.IMX02.iddocimx%TYPE
                          ,pasubproducto    IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                          ,paetapa            IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE
                          )
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: ELIMINA DOCUMENTO CON TODAS SUS PAGINAS
Par metros de entrada: paSolicitud IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta         IN DIGWEB.IMX01.imx01%TYPE
                      ,paDocumento      IN DIGWEB.IMX02.iddocimx%TYPE
                      ,pasubproducto    IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                      ,paetapa            IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEPt-2006
Modificado: José Alfredo Ortega Hernandez, (SINERGY SOLUTIONS)
Fecha: 28-Abril-2007
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
vlCons         DIGWEB.IMX01.expimx%TYPE;
vlDoc          NUMBER;


BEGIN
   BEGIN
     SELECT IM.expimx
      INTO vlCons
     FROM DIGWEB.IMX01 IM
     WHERE IM.APPIMX = paSolicitud   --13
     AND IM.IMX01 = paCuenta;


IF paSolicitud='CREDITO_WEB' THEN
  BEGIN

     SELECT IM2.DOCIMX  --2
      INTO vlDoc
     FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX, IM.EXPIMX
                             FROM DIGWEB.IMX01 IM
                             WHERE IM.APPIMX = paSolicitud
                             AND IM.IMX01 = paCuenta) IM1
     WHERE IM2.EXPIMX = IM1.EXPIMX
     AND IM2.IDDOCIMX = paDocumento
     AND IM2.APPIMX = paSolicitud
     --AND IM2.fisubproducto=pasubproducto
     AND (IM2.fisubproducto='1' OR IM2.fisubproducto='2')
     AND IM2.fietapa=paetapa
     AND IM2.statusimx=1;

    END;
    ELSE
    BEGIN

     SELECT IM2.DOCIMX  --2
      INTO vlDoc
     FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX, IM.EXPIMX
                             FROM DIGWEB.IMX01 IM
                             WHERE IM.APPIMX = paSolicitud
                             AND IM.IMX01 = paCuenta) IM1
     WHERE IM2.EXPIMX = IM1.EXPIMX
     AND IM2.IDDOCIMX = paDocumento
     AND IM2.APPIMX = paSolicitud
     AND IM2.fisubproducto=pasubproducto
     AND IM2.fietapa=paetapa
     AND IM2.statusimx=1;

    END;
END IF;
 EXCEPTION WHEN NO_DATA_FOUND THEN
NULL;

   END;

IF paSolicitud='CREDITO_WEB' THEN
  BEGIN
       OPEN cCursorsalida FOR
        SELECT COUNT(1)
          FROM DIGWEB.IMX03 IM3
          WHERE IM3.APPIMX= paSolicitud
            AND IM3.expimx = vlCons
            AND IM3.docimx = vlDoc
            --AND IM3.fisubproducto=pasubproducto
             AND (IM3.fisubproducto='1' OR IM3.fisubproducto='2')
            AND IM3.fietapa=paetapa
            AND IM3.STATUSIMX=1;
         RETURN cCursorsalida;
    END;
    ELSE
    BEGIN
       OPEN cCursorsalida FOR
        SELECT COUNT(1)
          FROM DIGWEB.IMX03 IM3
          WHERE IM3.APPIMX= paSolicitud
            AND IM3.expimx = vlCons
            AND IM3.docimx = vlDoc
            AND IM3.fisubproducto=pasubproducto
            AND IM3.fietapa=paetapa
            AND IM3.STATUSIMX=1;
         RETURN cCursorsalida;
    END;
    END IF;

END;
/


--
-- TMPFNCLSWLS0004JAD  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0004JAD( paSolicitud     IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta         IN DIGWEB.IMX01.IMX01%TYPE
                          ,paDocumento      IN DIGWEB.IMX02.iddocimx%TYPE
                          ,pasubproducto    IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                          ,paetapa            IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE
                          )
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:DIGWEB
Descripcion: Regresa las direcciones de los archivos
Par metros de entrada: paSolicitud   IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta      IN DIGWEB.IMX01.imx01%TYPE --00120102010201
                      ,paDocumento   IN DIGWEB.IMX02.iddocimx%TYPE--2, 510,1,33
                      ,pasubproducto IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                      ,paetapa         IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE

Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: JOSÉ ALFREDO ORTEGA HERNANDEZ
Fecha: 02-MAY-2007
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
vlCons        DIGWEB.IMX01.expimx%TYPE;
vlDoc          NUMBER;
vlCont         NUMBER;
vlError        NUMBER;
BEGIN

  BEGIN
   SELECT IM.expimx
    INTO vlCons
    FROM DIGWEB.IMX01 IM
    WHERE IM.APPIMX = paSolicitud
    AND IM.IMX01 = paCuenta;

    IF paSolicitud = 'CREDITO_WEB' THEN
    BEGIN
    SELECT IM2.DOCIMX
     INTO vlDoc
     FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                       FROM DIGWEB.IMX01 IM
                       WHERE IM.APPIMX = paSolicitud
                       AND IM.IMX01 = paCuenta) IM1
     WHERE IM2.EXPIMX = IM1.EXPIMX
     AND IM2.IDDOCIMX = paDocumento
     AND IM2.APPIMX = paSolicitud
     --AND IM2.fisubproducto=pasubproducto
     --AND IM2.fietapa=paetapa
     AND (IM2.fisubproducto='1' OR IM2.fisubproducto='2')
     AND IM2.fietapa='1'

     AND IM2.statusimx=1;
     END;
     ELSE
     BEGIN
    SELECT IM2.DOCIMX
     INTO vlDoc
     FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                       FROM DIGWEB.IMX01 IM
                       WHERE IM.APPIMX = paSolicitud
                       AND IM.IMX01 = paCuenta) IM1
     WHERE IM2.EXPIMX = IM1.EXPIMX
     AND IM2.IDDOCIMX = paDocumento
     AND IM2.APPIMX = paSolicitud
     AND IM2.fisubproducto=pasubproducto
     AND IM2.fietapa=paetapa
     AND IM2.statusimx=1;

     END;
     END IF;

EXCEPTION WHEN NO_DATA_FOUND THEN

 BEGIN
   vlError := 1;
 END;

 END;


     IF paSolicitud = 'CREDITO_WEB' THEN
    BEGIN
    OPEN cCursorsalida FOR
         SELECT IM3.RUTIMX
          FROM DIGWEB.IMX03 IM3
         WHERE IM3.APPIMX= paSolicitud
         AND IM3.expimx = vlCons
         AND IM3.docimx = vlDoc
--         AND IM3.fisubproducto=pasubproducto
--         AND IM3.fietapa=paetapa;
         AND (IM3.fisubproducto='1' OR IM3.fisubproducto='2')
         AND IM3.fietapa='1';

         RETURN cCursorsalida;
    END;
    ELSE
    BEGIN
    OPEN cCursorsalida FOR
         SELECT IM3.RUTIMX
          FROM DIGWEB.IMX03 IM3
         WHERE IM3.APPIMX= paSolicitud
         AND IM3.expimx = vlCons
         AND IM3.docimx = vlDoc
         AND IM3.fisubproducto=pasubproducto
         AND IM3.fietapa=paetapa;
         RETURN cCursorsalida;
    END;
    END IF;


END;
/


--
-- TMPFNCLSWLS0004JAE  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0004JAE( paSolicitud     IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta         IN DIGWEB.IMX01.imx01%TYPE --00120102010201
                          ,paDocumento      IN DIGWEB.IMX02.iddocimx%TYPE
                          ,pausuarioimx     IN DIGWEB.IMX03.USUARIOIMX%TYPE
                          ,pawsimx          IN DIGWEB.IMX03.WSIMX%TYPE
                          ,pasubproducto    IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                          ,paetapa            IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE
                          ,panumpag         NUMBER
                          ,panamepag        IN DIGWEB.IMX03.IMGIMX%TYPE
                          ,parutapag        IN DIGWEB.IMX03.RUTIMX%TYPE)--nimero de pagina a ser sctualizado a 0
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:DIGITALIZACION WEB
Descripcion: CAMBIA ESTATUS DE PAGINA DEL DOCUMENTO
Par metros de entrada: paSolicitud IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN DIGWEB.IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN DIGWEB.IMX02.iddocimx%TYPE--2, 510,1,33
                      ,pausuarioimx     IN DIGWEB.IMX02.STATUSIMX%TYPE
                      ,pawsimx          IN DIGWEB.IMX03.WSIMX%TYPE
                      ,pasubproducto    IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                      ,paetapa            IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE
                      ,panumpag         NUMBER)--nimero de pagina a ser sctualizado a 0

Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: JOSE ALFREDO ORTEGA HERNANDEZ (SINERGY SOLUTIONS)
Fecha: 03-MAY-2007
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
vlCons        DIGWEB.IMX01.expimx%TYPE;
vlDoc          NUMBER;
vlCont         NUMBER;
vlError        NUMBER;
v_countpg      NUMBER(2);
vlpag        NUMBER;
BEGIN
   BEGIN
     SELECT IM.expimx
      INTO vlCons
     FROM DIGWEB.IMX01 IM
     WHERE IM.APPIMX = paSolicitud
     AND IM.IMX01 = paCuenta;


     IF paSolicitud = 'CREDITO_WEB' THEN
     BEGIN
         SELECT IM2.DOCIMX
          INTO vlDoc
         FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX, IM.EXPIMX
                                 FROM DIGWEB.IMX01 IM
                                 WHERE IM.APPIMX = paSolicitud
                                 AND IM.IMX01 = paCuenta) IM1
         WHERE IM2.EXPIMX = IM1.EXPIMX
         AND IM2.IDDOCIMX = paDocumento
         AND IM2.APPIMX = paSolicitud
         --AND IM2.fisubproducto=pasubproducto
         --AND IM2.fietapa=paetapa
         AND (IM2.fisubproducto='1' OR IM2.fisubproducto='2')
         AND IM2.fietapa='1'
         AND IM2.statusimx=1;

         SELECT  RR.PAGIMX
              INTO vlpag
              FROM (
            SELECT ROWNUM lista, IM3.*
            FROM  DIGWEB.IMX03 IM3
                WHERE IM3.APPIMX= paSolicitud
                AND IM3.expimx = vlCons
                AND IM3.docimx = vlDoc
                --AND IM3.fisubproducto=pasubproducto
                --AND IM3.fietapa=paetapa
                AND IM3.fietapa='1'
                AND (IM3.fisubproducto='1' OR IM3.fisubproducto='2')
                AND IM3.STATUSIMX=1
                ORDER BY IM3.PAGIMX) RR
                WHERE RR.lista = panumpag;



             UPDATE DIGWEB.IMX03 IM3
                SET IM3.IMGIMX=panamepag,
                    IM3.RUTIMX=parutapag
            WHERE IM3.APPIMX= paSolicitud
                AND IM3.expimx = vlCons
                AND IM3.docimx = vlDoc
                --AND IM3.fisubproducto=pasubproducto
                --AND IM3.fietapa=paetapa
                AND IM3.fietapa='1'
                AND (IM3.fisubproducto='1' OR IM3.fisubproducto='2')
                AND IM3.PAGIMX=vlpag; --parametro que indica el nomero de pagina para cambiar estatutus
    END;
    ELSE
    BEGIN
         SELECT IM2.DOCIMX
          INTO vlDoc
         FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX, IM.EXPIMX
                                 FROM DIGWEB.IMX01 IM
                                 WHERE IM.APPIMX = paSolicitud
                                 AND IM.IMX01 = paCuenta) IM1
         WHERE IM2.EXPIMX = IM1.EXPIMX
         AND IM2.IDDOCIMX = paDocumento
         AND IM2.APPIMX = paSolicitud
         AND IM2.fisubproducto=pasubproducto
         AND IM2.fietapa=paetapa
         AND IM2.statusimx=1;

         SELECT  RR.PAGIMX
              INTO vlpag
              FROM (
            SELECT ROWNUM lista, IM3.*
            FROM  DIGWEB.IMX03 IM3
                WHERE IM3.APPIMX= paSolicitud
                AND IM3.expimx = vlCons
                AND IM3.docimx = vlDoc
                AND IM3.fisubproducto=pasubproducto
                AND IM3.fietapa=paetapa
                AND IM3.STATUSIMX=1
                ORDER BY IM3.PAGIMX) RR
                WHERE RR.lista = panumpag;



             UPDATE DIGWEB.IMX03 IM3
                SET IM3.IMGIMX=panamepag,
                    IM3.RUTIMX=parutapag
            WHERE IM3.APPIMX= paSolicitud
                AND IM3.expimx = vlCons
                AND IM3.docimx = vlDoc
                AND IM3.fisubproducto=pasubproducto
                AND IM3.fietapa=paetapa
                AND IM3.PAGIMX=vlpag; --parametro que indica el nomero de pagina para cambiar estatutus

    END;
    END IF;


EXCEPTION WHEN NO_DATA_FOUND THEN

 BEGIN
  vlError := 1;
 END;
   END;

    IF vlError = 1 THEN
      ROLLBACK;
       OPEN cCursorsalida FOR
         SELECT 'E' MSG
          FROM DUAL;
       RETURN cCursorsalida;
    ELSE
     COMMIT;
       OPEN cCursorsalida FOR
        SELECT ' ' MSG
         FROM DUAL;
         RETURN cCursorsalida;
    END IF;


END;
/


--
-- TMPFNCLSWLS0006  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0006 ( paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                          ,paDocumento IN IMX02.iddocimx%TYPE) --2, 510,1,33
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion:
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN IMX02.iddocimx%TYPE--2, 510,1,33
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida PATYPES.RCGCURSOR;

BEGIN
   OPEN cCursorsalida FOR
      SELECT IMC.T
            ,IMR.RUTIMX
        FROM ( SELECT COUNT(1)  T
                 FROM IMX03 IM3
                     ,( SELECT IM2.EXPIMX
                              ,IM2.DOCIMX
                          FROM IMX02 IM2
                              ,( SELECT IM.APPIMX
                                       ,IM.EXPIMX
                                   FROM IMX01 IM
                                  WHERE IM.APPIMX = paSolicitud
                                    AND IM.IMX01 = paCuenta )  IM1
                          WHERE IM2.EXPIMX = IM1.EXPIMX
                            AND IM2.IDDOCIMX = paDocumento) IM4
                          WHERE IM3.EXPIMX = IM4.EXPIMX
                           AND IM3.DOCIMX = IM4.DOCIMX
                           AND IM3.APPIMX = paSolicitud) IMC,
                              (SELECT IM3.rutimx
                 FROM IMX03 IM3
                     ,( SELECT IM2.EXPIMX
                              ,IM2.DOCIMX
                          FROM IMX02 IM2
                              ,( SELECT IM.APPIMX
                                       ,IM.EXPIMX
                                   FROM IMX01 IM
                                  WHERE IM.APPIMX = paSolicitud
                                    AND IM.IMX01 = paCuenta)  IM1
                          WHERE IM2.EXPIMX = IM1.EXPIMX
                            AND IM2.IDDOCIMX = paDocumento
                            AND IM2.APPIMX = paSolicitud) IM4
                          WHERE IM3.EXPIMX = IM4.EXPIMX
                           AND IM3.DOCIMX = IM4.DOCIMX
                           AND IM3.APPIMX = paSolicitud
                           AND IM3.PAGIMX = 1) IMR;

   RETURN cCursorsalida;

EXCEPTION
     WHEN OTHERS THEN
    NULL;
END;
/


--
-- TMPFNCLSWLS0007  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0007 ( paFiOpeDoc IN CATDOCUMENTOS.fiopedocumento%TYPE,
                                           paFisubproducto IN CATDOCUMENTOS.FISUBPRODUCTO%TYPE,
                                           paFietapa    IN CATDOCUMENTOS.FIETAPA%TYPE)
RETURN  PATYPES.RCGCURSOR
IS
cCursorsalida PATYPES.RCGCURSOR;

BEGIN
IF paFietapa =0 AND paFisubproducto = 0 AND paFiOpeDoc<>24 THEN
   OPEN cCursorsalida FOR
      SELECT CAT.fiiddocumento
            ,CAT.fcdescdocumento
            ,CAT.fistatus,
             D.ORDERDOC,
            A.DESCTITULO,
            D.IDTABLA
         FROM DIGWEB.CATDOCUMENTOS CAT, DIGWEB.ORDERDOCS D, DIGWEB.DESCHEADERS A
       WHERE CAT.fiopedocumento = paFiOpeDoc
       AND D.FIDDOCUMENTO=CAT.FIIDDOCUMENTO
       AND D.FIETAPA=CAT.FIETAPA
       AND D.FISUBPRODUCTO=CAT.FISUBPRODUCTO
       AND D.FIOPEDOCUMENTO= CAT.FIOPEDOCUMENTO
       AND A.IDTABLA=D.IDTABLA;
   RETURN cCursorsalida;
 ELSE
  OPEN cCursorsalida FOR
      SELECT CAT.fiiddocumento
            ,CAT.fcdescdocumento
            ,CAT.fistatus,
            D.ORDERDOC,
            A.DESCTITULO,
            D.IDTABLA
        FROM DIGWEB.CATDOCUMENTOS CAT, DIGWEB.ORDERDOCS D, DIGWEB.DESCHEADERS A
       WHERE CAT.fiopedocumento = paFiOpeDoc
       AND CAT.FIETAPA = paFietapa
       AND CAT.FISUBPRODUCTO = paFisubproducto
       AND D.FIDDOCUMENTO=CAT.FIIDDOCUMENTO
       AND D.FIETAPA=CAT.FIETAPA
       AND D.FISUBPRODUCTO=CAT.FISUBPRODUCTO
       AND D.FIOPEDOCUMENTO= CAT.FIOPEDOCUMENTO
       AND A.IDTABLA=D.IDTABLA
       ORDER BY D.ORDERDOC;
   RETURN cCursorsalida;
  END IF;

EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- TMPFNCLSWLS0005  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0005 ( paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta    IN IMX01.imx01%TYPE --00120102010201
                          ,paDocumento IN IMX02.iddocimx%TYPE) --2, 510,1,33
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: REGRESA IMAGENES CON RUTAS DE UN DOCUMENTO EN ESPECIFICO
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN IMX02.iddocimx%TYPE--2, 510,1,33
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida PATYPES.RCGCURSOR;

BEGIN
   OPEN cCursorsalida FOR
      SELECT
             IM3.pagimx
            ,IM3.imgimx
            ,IM3.rutimx
        FROM IMX03 IM3
            ,( SELECT IM2.EXPIMX
                     ,IM2.DOCIMX
                 FROM IMX02 IM2
                     ,( SELECT IM.APPIMX
                              ,IM.EXPIMX
                         FROM IMX01 IM
                        WHERE IM.APPIMX = paSolicitud
                          AND IM.IMX01 = paCuenta ) IM1
                 WHERE IM2.EXPIMX = IM1.EXPIMX
                   AND IM2.IDDOCIMX = paDocumento
                   AND IM2.APPIMX = paSolicitud) IM4
                WHERE IM3.EXPIMX = IM4.EXPIMX
                  AND IM3.DOCIMX = IM4.DOCIMX
                  AND IM3.APPIMX = paSolicitud
                  ORDER BY PAGIMX ASC;

   RETURN cCursorsalida;

EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- TMPFNCLSWLS0008  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0008 (  paFiOpeDocumento  IN CATDOCUMENTOS.fiopedocumento%TYPE
                           ,paAPPIMX          IN  IMX01.APPIMX%TYPE
                           ,paIMX01    IMX01.IMX01%TYPE
                           ,paFisubproducto IN CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                           ,paFietapa    IN CATDOCUMENTOS.FIETAPA%TYPE)
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: OBTIENE LO DOCUMENTOS DIGITALIZADOS DE UN EXPEDIENTE EN ESPECIFICO
Par metros de entrada: paFiOpeDocumento  IN CATDOCUMENTOS.fiopedocumento%TYPE
                      ,paAPPIMX          IN  IMX01.APPIMX%TYPE
                      ,paIMX01           IMX01.IMX01%TYPE)
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida PATYPES.RCGCURSOR;
csStatus CONSTANT CHAR(1):='D';

BEGIN
          IF paFietapa =0 AND paFisubproducto = 0 THEN
   OPEN cCursorsalida FOR
      /*SELECT IM22.IDDOCIMX
            ,csStatus status
        FROM IMX01 IM1
            ,(SELECT IM2.EXPIMX
                    ,IM2.IDDOCIMX  FROM IMX02 IM2
                    ,( SELECT CAT.fiiddocumento
                             ,UPPER(CATO.fcdescoperadocto) GAB
                         FROM CATDOCUMENTOS CAT
                             ,CATOPERADOCTOS CATO
                        WHERE CATO.fiopedocumento = CAT.fiopedocumento
                          AND CAT.fiopedocumento = paFiOpeDocumento)CATD
              WHERE IM2.IDDOCIMX = CATD.fiiddocumento
                AND IM2.APPIMX = CATD.GAB
                AND IM2.APPIMX = paAPPIMX) IM22
        WHERE IM1.EXPIMX = IM22.EXPIMX
          AND IM1.imx01 = paIMX01;*/

          SELECT IM22.IDDOCIMX
         ,csStatus status
     FROM IMX01 IM1
         ,( SELECT IM2.EXPIMX
                  ,IM2.IDDOCIMX
              FROM IMX02 IM2
                  ,( SELECT CAT.fiiddocumento
                       FROM CATDOCUMENTOS CAT
                      WHERE CAT.fiopedocumento = paFiOpeDocumento) IMC
                      WHERE IM2.APPIMX = paAPPIMX
                        AND IM2.iddocimx = IMC.fiiddocumento) IM22
              WHERE IM1.EXPIMX = IM22.EXPIMX
                AND IM1.imx01 = paIMX01
                AND IM1.APPIMX = paAPPIMX;
                RETURN cCursorsalida;

        ELSE
         OPEN cCursorsalida FOR
                  SELECT IM22.IDDOCIMX
         ,csStatus status
     FROM IMX01 IM1
         ,( SELECT IM2.EXPIMX
                  ,IM2.IDDOCIMX
              FROM IMX02 IM2
                  ,( SELECT CAT.fiiddocumento
                       FROM CATDOCUMENTOS CAT
                      WHERE CAT.fiopedocumento = paFiOpeDocumento AND CAT.FIETAPA = paFietapa AND CAT.FISUBPRODUCTO = paFisubproducto) IMC
                      WHERE IM2.APPIMX = paAPPIMX
                        AND IM2.iddocimx = IMC.fiiddocumento) IM22
              WHERE IM1.EXPIMX = IM22.EXPIMX
                AND IM1.imx01 = paIMX01
                AND IM1.APPIMX = paAPPIMX;
                RETURN cCursorsalida;
         END IF;

EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- TMPFNCLSWLS0008B  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0008B (  paFiOpeDocumento  IN CATDOCUMENTOS.fiopedocumento%TYPE
                           ,paAPPIMX          IN  IMX01.APPIMX%TYPE
                           ,paIMX01    IMX01.IMX01%TYPE
                           ,paFisubproducto IN CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                           ,paFietapa    IN CATDOCUMENTOS.FIETAPA%TYPE)
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: OBTIENE LO DOCUMENTOS DIGITALIZADOS DE UN EXPEDIENTE EN ESPECIFICO
Par metros de entrada: paFiOpeDocumento  IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE
                      ,paAPPIMX          IN  DIGWEB.IMX01.APPIMX%TYPE
                      ,paIMX01           DIGWEB.IMX01.IMX01%TYPE)
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida PATYPES.RCGCURSOR;
csStatus CONSTANT CHAR(1):='D';

BEGIN


--IF paFisubproducto=2 AND paAPPIMX='CREDITO_WEB' THEN
IF paAPPIMX='CREDITO_WEB' THEN

BEGIN
         OPEN cCursorsalida FOR
                  SELECT IM22.IDDOCIMX
         ,csStatus status
     FROM IMX01 IM1
         ,( SELECT IM2.EXPIMX
                  ,IM2.IDDOCIMX
              FROM IMX02 IM2
                  ,( SELECT CAT.fiiddocumento
                       FROM CATDOCUMENTOS CAT
                      WHERE CAT.fiopedocumento = paFiOpeDocumento AND CAT.FIETAPA = paFietapa AND CAT.FISUBPRODUCTO = paFisubproducto) IMC
                      WHERE IM2.APPIMX = paAPPIMX
                        AND IM2.iddocimx = IMC.fiiddocumento
                        --AND IM2.FIETAPA = paFietapa
                        --AND IM2.FISUBPRODUCTO = paFisubproducto
                        AND IM2.FIETAPA = '1'
                        AND (IM2.FISUBPRODUCTO = '1' OR IM2.FISUBPRODUCTO = '2')
                        AND IM2.STATUSIMX = 1
                        ) IM22
              WHERE IM1.EXPIMX = IM22.EXPIMX
                AND IM1.imx01 = paIMX01
                AND IM1.APPIMX=paAPPIMX;
            RETURN cCursorsalida;
            END;
ELSE
BEGIN


 OPEN cCursorsalida FOR
                  SELECT IM22.IDDOCIMX
         ,csStatus status
     FROM IMX01 IM1
         ,( SELECT IM2.EXPIMX
                  ,IM2.IDDOCIMX
              FROM IMX02 IM2
                  ,( SELECT CAT.fiiddocumento
                       FROM CATDOCUMENTOS CAT
                      WHERE CAT.fiopedocumento = paFiOpeDocumento AND CAT.FIETAPA = paFietapa AND CAT.FISUBPRODUCTO = paFisubproducto) IMC
                      WHERE IM2.APPIMX = paAPPIMX
                        AND IM2.iddocimx = IMC.fiiddocumento
                        AND IM2.FIETAPA = paFietapa
                        AND IM2.FISUBPRODUCTO = paFisubproducto
                        AND IM2.STATUSIMX = 1
                        ) IM22
              WHERE IM1.EXPIMX = IM22.EXPIMX
                AND IM1.imx01 = paIMX01
                AND IM1.APPIMX=paAPPIMX;
                RETURN cCursorsalida;
                                END;
END IF;
EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- TMPFNCLSWLS0009  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0009 (  paFiOpeDocumento  IN CATDOCUMENTOS.fiopedocumento%TYPE --21
                           ,paFiiddocumento   IN  CATDOCUMENTOS.fiiddocumento%TYPE) --1
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: OBTIENE DESCRIPCION DE UN DOCUMENTO TABLA CATDOCUMENTOS
Par metros de entrada:
                       paFiOpeDocumento  INT  --21
                      ,paFiiddocumento   INT  --1
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida PATYPES.RCGCURSOR;

BEGIN
   OPEN cCursorsalida FOR
      SELECT CAT.fcdescdocumento
        FROM CATDOCUMENTOS CAT
       WHERE CAT.fiopedocumento = paFiOpeDocumento
         AND CAT.fiiddocumento = paFiiddocumento;
 RETURN cCursorsalida;

EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- TMPFNCLSWLS0010  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0010 ( paSolicitud  IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta     IN IMX01.imx01%TYPE --00120102010201
                          ,paDocumento  IN IMX02.iddocimx%TYPE--2, 510,1,33
                          ,paPagina     IN IMX03.pagimx%TYPE) --1,2,3,4 ETC.
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: REGRESA PAGINA SELECCIONADA DE UN DOCUMENTO
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN IMX02.iddocimx%TYPE--2, 510,1,33
                      ,paPagina IN IMX03.pagimx%TYPE--1,2,3,4 ETC.
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;

BEGIN
   OPEN cCursorsalida FOR
      SELECT IM3.imgimx
            ,IM3.rutimx
        FROM IMX03 IM3
            ,( SELECT IM2.EXPIMX
                     ,IM2.DOCIMX
                 FROM IMX02 IM2
                     ,( SELECT IM.APPIMX
                              ,IM.EXPIMX
                          FROM IMX01 IM
                         WHERE IM.APPIMX = paSolicitud
                           AND IM.IMX01 = paCuenta) IM1
                 WHERE IM2.EXPIMX = IM1.EXPIMX
                   AND IM2.IDDOCIMX = paDocumento
                   AND IM2.APPIMX = paSolicitud) IM4
                 WHERE IM3.EXPIMX = IM4.EXPIMX
                   AND IM3.DOCIMX = IM4.DOCIMX
                   AND IM3.APPIMX = paSolicitud
                   AND IM3.PAGIMX = paPagina;
   RETURN cCursorsalida;

EXCEPTION
   WHEN OTHERS THEN
    NULL;
END;
/


--
-- TMPFNCLSWLS0011  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0011 ( paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta    IN IMX01.imx01%TYPE)--00120102010201
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: OBTIENE EXPIMX DE UN EXPEDIENTE EN ESPECIFICO
Par metros de entrada:
                       paFiOpeDocumento  INT  --21
                      ,paFiiddocumento   INT  --1
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida PATYPES.RCGCURSOR;

BEGIN
   OPEN cCursorsalida FOR
      SELECT IM1.EXPIMX FROM IMX01 IM1
      WHERE IM1.APPIMX = paSolicitud
      AND IM1.IMX01 = paCuenta;
 RETURN cCursorsalida;

EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- TMPFNCLSWLS0012  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0012 (  paSolicitud  IN IMX01.appimx%TYPE--CAPTACION
                           ,paCuenta     IN DIGWEB.IMX01.imx01%TYPE)--00120102010201
RETURN  DIGWEB.PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: CAMBIA STATUS DE EXPEDIENTE A M
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                       ,paCuenta IN IMX01.imx01%TYPE--00120102010201
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 09-OCT-2006
**************************************************************************************************/
cCursorsalida  DIGWEB.PATYPES.RCGCURSOR;
vlError        NUMBER;
vlStatus       IMX01.edoimx%TYPE;
BEGIN
  BEGIN
   UPDATE IMX01 IM
      SET IM.EDOIMX='M'
    WHERE IM.APPIMX = paSolicitud
      AND IM.IMX01 = paCuenta
      RETURNING IM.EDOIMX INTO vlStatus;
      EXCEPTION WHEN OTHERS THEN
      vlError := 1;
    END;
    IF vlStatus IS NULL THEN
       OPEN cCursorsalida FOR
          SELECT 'ERROR' MSG FROM DUAL;
       RETURN cCursorsalida;
    ELSE
       OPEN cCursorsalida FOR
          SELECT 'CORRECTO' MSG FROM DUAL;
       RETURN cCursorsalida;
    END IF;

EXCEPTION
   WHEN OTHERS THEN
       NULL;
END;
/


--
-- TMPFNCLSWLS00014  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS00014( paSolicitud  IN IMX01.appimx%TYPE--CAPTACION
                         ,paCuenta     IN DIGWEB.IMX01.imx01%TYPE--00120102010201
                         ,paCatODoc    IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                         ,paDocumento  IN DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                         ,paRutImg     IN DIGWEB.IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
RETURN  DIGWEB.PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: CREAD DOCUMENTO, AGREGA PAGINAS A DOCUMENTO Y CAMBIA EL ESTADO DEL EXPEDIENTE A M
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                       ,paCuenta IN IMX01.imx01%TYPE--00120102010201
                       ,paCatODoc IN CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                       ,paDocumento IN CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                       ,paImg IMX03.imgimx%TYPE--imagen.jpg
                       ,paRutImg IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida  DIGWEB.PATYPES.RCGCURSOR;
cTemp          PATYPES.RCGCURSOR;
vlBanderaD     NUMBER;
vlMaximo       NUMBER;
vlAppimx       DIGWEB.imx03.appimx%TYPE;
vlExpimx       DIGWEB.imx03.expimx%TYPE;
vlDocimx       DIGWEB.imx03.docimx%TYPE;
vlPagimx       NUMBER;
vlDescdoc      DIGWEB.CATDOCUMENTOS.fcdescdocumento%TYPE;
vlFildoc       DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE;
vlError        NUMBER;
vlCons         NUMBER; --CONSECUTIVO OBTENIDO
vlLongitud     NUMBER; --LOGITUD DEL IMX
vlMaximoF      NUMBER :=0; -- MAXIMO CONSECUTIVO
vlExiste       NUMBER; --EXISTEN REGISTROS CON FECHAS
vlMaximoR      NUMBER;
vlExpi         IMX03.expimx%TYPE;
vlImg          IMX03.imgimx%TYPE;

BEGIN
  BEGIN
     SELECT COUNT(1) INTO vlBanderaD
       FROM DIGWEB.IMX02 IM2,
           ( SELECT IM.APPIMX
                   ,IM.EXPIMX
               FROM DIGWEB.IMX01 IM
              WHERE IM.APPIMX =paSolicitud
                AND IM.IMX01 = paCuenta) IM1
              WHERE IM2.EXPIMX = IM1.EXPIMX
                AND IM2.IDDOCIMX = paDocumento
                AND IM2.APPIMX = paSolicitud;

                   IF vlBanderaD = 1 THEN
                   --EXSTE EL DOCUMENTO
                      SELECT MAX(IM3.PAGIMX)+1
                        INTO vlPagimx
                        FROM DIGWEB.IMX03 IM3
                            ,(SELECT IM2.EXPIMX
                                    ,IM2.DOCIMX
                                FROM DIGWEB.IMX02 IM2
                                    ,( SELECT IM.APPIMX
                                             ,IM.EXPIMX
                                         FROM DIGWEB.IMX01 IM
                                        WHERE IM.APPIMX =paSolicitud
                                          AND IM.IMX01 = paCuenta ) IM1
                                WHERE IM2.EXPIMX = IM1.EXPIMX
                                  AND IM2.IDDOCIMX = paDocumento
                                      ) IM4
                        WHERE IM3.EXPIMX = IM4.EXPIMX
                          AND IM3.DOCIMX = IM4.DOCIMX
                          AND IM3.APPIMX = paSolicitud;

                       SELECT
                     DISTINCT IM3.APPIMX
                             ,IM3.EXPIMX
                             ,IM3.DOCIMX
                         INTO vlAppimx
                             ,vlExpimx
                             ,vlDocimx
                         FROM DIGWEB.IMX03 IM3
                             ,( SELECT IM2.EXPIMX
                                      ,IM2.DOCIMX
                                  FROM DIGWEB.IMX02 IM2
                                      ,( SELECT IM.APPIMX
                                               ,IM.EXPIMX
                                           FROM DIGWEB.IMX01 IM
                                          WHERE IM.APPIMX = paSolicitud
                                            AND IM.IMX01 = paCuenta
                                       ) IM1
                                 WHERE IM2.EXPIMX = IM1.EXPIMX
                                   AND IM2.IDDOCIMX = paDocumento) IM4
                        WHERE IM3.EXPIMX = IM4.EXPIMX
                          AND IM3.DOCIMX = IM4.DOCIMX
                          AND IM3.APPIMX = paSolicitud;
                           ---VERIFICAMOS QUE EXISTA LA FECHA

                       SELECT COUNT(1)
                         INTO vlExiste
                         FROM DIGWEB.IMX03 IM3
                        WHERE IM3.rutimx
                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                            IF vlExiste > 0 THEN
                            --FECHA ACTUAL
                               OPEN cTemp FOR
                                  SELECT IM3.expimx
                                        ,IM3.imgimx
                                    INTO vlExiste,
                                         vlImg
                                    FROM DIGWEB.IMX03 IM3
                                   WHERE IM3.rutimx
                                    LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;
                                    LOOP
                                   FETCH cTemp INTO vlExpi,vlImg;
                                    EXIT WHEN cTemp%NOTFOUND;
                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                      IF vlCons > vlMaximoF THEN
                                         vlMaximoF := vlCons;
                                         vlMaximoR :=1 + vlMaximoF;
                                      END IF;
                                     END LOOP;
                               CLOSE cTemp;

                              INSERT
                                INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                              VALUES( vlAppimx
                                     ,vlExpimx
                                     ,vlDocimx
                                     ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                     ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                     ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                      COMMIT;
                                 OPEN cCursorsalida FOR
                                    SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                          ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                    RETURN cCursorsalida;
                            ELSE
                            --NO HAY FECHA ACTUAL VERIFICA SI HAY ANTETERIOR O NO HAY REGISTROS
                               SELECT COUNT(1)
                                 INTO vlExiste
                                 FROM DIGWEB.IMX03 IM3
                                WHERE IM3.rutimx
                                 LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                  IF vlExiste > 0 THEN

                                     OPEN cTemp FOR
                                        SELECT IM3.expimx
                                              ,IM3.imgimx
                                          INTO vlExiste,
                                                 vlImg
                                          FROM DIGWEB.IMX03 IM3
                                         WHERE IM3.rutimx
                                          LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;

                                          LOOP
                                             FETCH cTemp INTO vlExpi
                                                             ,vlImg;
                                              EXIT WHEN cTemp%NOTFOUND;
                                                   vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                   vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                IF vlCons > vlMaximoF THEN
                                                   vlMaximoF := vlCons;
                                                   vlMaximoR :=1 + vlMaximoF;
                                               END IF;
                                          END LOOP;
                                     CLOSE cTemp;

                                    INSERT
                                      INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                    VALUES( vlAppimx
                                           ,vlExpimx
                                           ,vlDocimx
                                           ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                           ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                           ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                            COMMIT;
                                       OPEN cCursorsalida FOR
                                          SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                       RETURN cCursorsalida;
                                  ELSE
                                  --NO EXISTEN REGISTROS PONEMOS EL PRIMER CONSECUTIVO
                                     INSERT
                                       INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                     VALUES( vlAppimx
                                            ,vlExpimx
                                            ,vlDocimx
                                            ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                            ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                            ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                             COMMIT;
                                        OPEN cCursorsalida FOR
                                           SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                 ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff') R2 FROM DUAL;
                                           RETURN cCursorsalida;
                                  END IF;
                            END IF;
                                     COMMIT;

                   ELSE
                   --NO EXISTE EL DOCUMENTO
                      SELECT CATD.fiIdDocumento
                            ,CATD.fcDescDocumento
                        INTO vlFildoc
                            ,vlDescdoc
                        FROM DIGWEB.CATDocumentos CATD
                       WHERE CATD.fiOpeDocumento = paCatODoc
                         AND CATD.fiIdDocumento=paDocumento;

                      SELECT IM.APPIMX
                            ,IM.EXPIMX
                        INTO vlAppimx
                            ,vlExpimx
                        FROM DIGWEB.IMX01 IM
                       WHERE IM.APPIMX = paSolicitud
                         AND IM.IMX01 = paCuenta;
                   ----------OBTENEMOS CONSECUTIVO
                      SELECT MAX(IM2.DOCIMX)+1
                        INTO vlMaximo
                        FROM DIGWEB.IMX02 IM2
                            ,( SELECT IM.APPIMX
                                     ,IM.EXPIMX
                                 FROM DIGWEB.IMX01 IM
                                WHERE IM.APPIMX = paSolicitud
                                  AND IM.IMX01 = paCuenta
                             ) IM1
                       WHERE IM2.EXPIMX = IM1.EXPIMX
                         AND IM1.APPIMX = IM2.APPIMX;

                          IF vlMaximo IS NOT NULL THEN
                             INSERT
                               INTO DIGWEB.IMX02 (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX)
                             VALUES( vlAppimx
                                    ,vlExpimx
                                    ,vlMaximo
                                    ,vlFildoc
                                    ,vlDescdoc);

                             SELECT COUNT(1)
                               INTO vlExiste
                               FROM DIGWEB.IMX03 IM3
                              WHERE IM3.rutimx
                               LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                                 IF vlExiste > 0 THEN
                                    --FECHA ACTUAL
                                    OPEN cTemp FOR
                                       SELECT IM3.expimx
                                             ,IM3.imgimx
                                         INTO vlExiste,
                                               vlImg
                                         FROM DIGWEB.IMX03 IM3
                                        WHERE IM3.rutimx
                                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;
                                         LOOP
                                            FETCH cTemp INTO vlExpi,vlImg;
                                             EXIT WHEN cTemp%NOTFOUND;
                                                  vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                  vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                               IF vlCons > vlMaximoF THEN
                                                  vlMaximoF := vlCons;
                                                  vlMaximoR :=1 + vlMaximoF;
                                              END IF;
                                         END LOOP;
                                    CLOSE cTemp;

                                   INSERT
                                     INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                   VALUES( vlAppimx
                                          ,vlExpimx
                                          ,vlMaximo
                                          ,1  --MAXIMO DEL DOCUMENTO
                                          ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                          ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                           COMMIT;
                                      OPEN cCursorsalida FOR
                                         SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                               ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                      RETURN cCursorsalida;

                                 ELSE
                                 --NO HAY EFCHA ACTUAL VERIFICAR SI HAY FECHA ANTERIOR O NO HAY REGISTROS
                                    SELECT COUNT(1)
                                      INTO vlExiste
                                      FROM DIGWEB.IMX03 IM3
                                     WHERE IM3.rutimx
                                      LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                        IF vlExiste > 0 THEN
                                           OPEN cTemp FOR
                                              SELECT IM3.expimx
                                                    ,IM3.imgimx
                                                INTO vlExiste,
                                                     vlImg
                                                FROM DIGWEB.IMX03 IM3
                                               WHERE IM3.rutimx
                                                LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;
                                                LOOP
                                                   FETCH cTemp INTO vlExpi
                                                                   ,vlImg;
                                                    EXIT WHEN cTemp%NOTFOUND;
                                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                      IF vlCons > vlMaximoF THEN
                                                         vlMaximoF := vlCons;
                                                         vlMaximoR :=1 + vlMaximoF;
                                                     END IF;
                                                END LOOP;
                                           CLOSE cTemp;

                                          INSERT
                                            INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                          VALUES( vlAppimx
                                                 ,vlExpimx
                                                 ,vlMaximo
                                                 ,1  --MAXIMO DEL DOCUMENTO
                                                 ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                                 ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                                  COMMIT;
                                             OPEN cCursorsalida FOR
                                                SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                      ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                             RETURN cCursorsalida;
                                        ELSE
                                           INSERT
                                             INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                           VALUES( vlAppimx
                                                  ,vlExpimx
                                                  ,vlMaximo
                                                  ,1  --MAXIMO DEL DOCUMENTO
                                                  ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                                  ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                                   COMMIT;
                                              OPEN cCursorsalida FOR
                                                 SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                       ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoF),'.tiff') R2 FROM DUAL;
                                              RETURN cCursorsalida;
                                        END IF;
                                 END IF;

                          ELSE
                             INSERT
                              INTO DIGWEB.IMX02 (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX)
                            VALUES( vlAppimx
                                   ,vlExpimx
                                   ,0
                                   ,vlFildoc
                                   ,vlDescdoc);

                             SELECT COUNT(1)
                               INTO vlExiste
                               FROM DIGWEB.IMX03 IM3
                              WHERE IM3.rutimx
                               LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                                 IF vlExiste > 0 THEN
                                 -- HAY FECHA ACTUAL
                                    OPEN cTemp FOR
                                       SELECT IM3.expimx
                                             ,IM3.imgimx
                                         INTO vlExiste,
                                               vlImg
                                         FROM DIGWEB.IMX03 IM3
                                        WHERE IM3.rutimx
                                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;

                                         LOOP
                                            FETCH cTemp INTO vlExpi
                                                            ,vlImg;
                                             EXIT WHEN cTemp%NOTFOUND;
                                                  vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                  vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                               IF vlCons > vlMaximoF THEN
                                                  vlMaximoF := vlCons;
                                                  vlMaximoR :=1 + vlMaximoF;
                                              END IF;
                                         END LOOP;
                                    CLOSE cTemp;

                                   INSERT
                                     INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                   VALUES( vlAppimx
                                          ,vlExpimx
                                          ,0
                                          ,1  --MAXIMO DEL DOCUMENTO
                                          ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                          ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                           COMMIT;
                                      OPEN cCursorsalida FOR
                                         SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                               ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                      RETURN cCursorsalida;
                                 ELSE
                                 --NO HAY EFCHA ACTUAL VERIFICAR SI HAY FECHA ANTERIOR O NO HAY REGISTROS
                                    SELECT COUNT(1)
                                      INTO vlExiste
                                      FROM DIGWEB.IMX03 IM3
                                     WHERE IM3.rutimx
                                      LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                        IF vlExiste > 0 THEN
                                           --EXITE FECHA ABNTERIOR
                                           OPEN cTemp FOR
                                              SELECT IM3.expimx
                                                    ,IM3.imgimx
                                                INTO vlExiste,
                                                     vlImg
                                                FROM DIGWEB.IMX03 IM3
                                               WHERE IM3.rutimx
                                                LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;
                                                LOOP
                                                   FETCH cTemp INTO vlExpi
                                                                   ,vlImg;
                                                    EXIT WHEN cTemp%NOTFOUND;
                                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                      IF vlCons > vlMaximoF THEN
                                                         vlMaximoF := vlCons;
                                                         vlMaximoR :=1 + vlMaximoF;
                                                     END IF;
                                                END LOOP;
                                           CLOSE cTemp;

                                          INSERT
                                            INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                          VALUES( vlAppimx
                                                 ,vlExpimx
                                                 ,0
                                                 ,1  --MAXIMO DEL DOCUMENTO
                                                 ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                                 ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                                  COMMIT;
                                             OPEN cCursorsalida FOR
                                                SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                      ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                             RETURN cCursorsalida;
                                        ELSE
                                        --NO EXISTEN REGISTROS
                                           INSERT
                                             INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                           VALUES( vlAppimx
                                                  ,vlExpimx
                                                  ,0
                                                  ,1  --MAXIMO DEL DOCUMENTO
                                                  ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                                  ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                                   COMMIT;
                                              OPEN cCursorsalida FOR
                                            SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                  ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff') R2 FROM DUAL;
                                            RETURN cCursorsalida;
                                         END IF;
                                 END IF;
                          END IF;
                   END IF;
                      EXCEPTION
                           WHEN OTHERS THEN
                          BEGIN
                                vlError := 1;
                            END;
                      END;

                       IF vlError = 1 THEN
                          ROLLBACK;
                              OPEN cCursorsalida FOR
                                 SELECT 'ERROR' MSG FROM DUAL;
                              RETURN cCursorsalida;
                       END IF;

EXCEPTION
 WHEN OTHERS
   THEN NULL;
END;
/


--
-- TMPFNCLSWLS0014  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0014( paSolicitud  IN IMX01.appimx%TYPE--CAPTACION
                         ,paCuenta     IN DIGWEB.IMX01.imx01%TYPE--00120102010201
                         ,paCatODoc    IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                         ,paDocumento  IN DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                         ,paRutImg     IN DIGWEB.IMX03.rutimx%TYPE
                         ,paSubproducto IN CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                         ,paEtapa    IN CATDOCUMENTOS.FIETAPA%TYPE) --c:imagen/imagen.jpg
RETURN  DIGWEB.PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: CREAD DOCUMENTO, AGREGA PAGINAS A DOCUMENTO Y CAMBIA EL ESTADO DEL EXPEDIENTE A M
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                       ,paCuenta IN IMX01.imx01%TYPE--00120102010201
                       ,paCatODoc IN CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                       ,paDocumento IN CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                       ,paImg IMX03.imgimx%TYPE--imagen.jpg
                       ,paRutImg IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/
cCursorsalida  DIGWEB.PATYPES.RCGCURSOR;
cTemp          PATYPES.RCGCURSOR;
vlBanderaD     NUMBER;
vlMaximo       NUMBER;
vlAppimx       DIGWEB.imx03.appimx%TYPE;
vlExpimx       DIGWEB.imx03.expimx%TYPE;
vlDocimx       DIGWEB.imx03.docimx%TYPE;
vlPagimx       NUMBER;
vlDescdoc      DIGWEB.CATDOCUMENTOS.fcdescdocumento%TYPE;
vlFildoc       DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE;
vlError        NUMBER;
vlCons         NUMBER; --CONSECUTIVO OBTENIDO
vlLongitud     NUMBER; --LOGITUD DEL IMX
vlMaximoF      NUMBER :=0; -- MAXIMO CONSECUTIVO
vlExiste       NUMBER; --EXISTEN REGISTROS CON FECHAS
vlMaximoR      NUMBER;
vlExpi         DIGWEB.IMX03.expimx%TYPE;
vlImg          DIGWEB.IMX03.imgimx%TYPE;

BEGIN
  BEGIN
     SELECT COUNT(1) INTO vlBanderaD
       FROM DIGWEB.IMX02 IM2,
           ( SELECT IM.APPIMX
                   ,IM.EXPIMX
               FROM DIGWEB.IMX01 IM
              WHERE IM.APPIMX =paSolicitud
                AND IM.IMX01 = paCuenta) IM1
              WHERE IM2.EXPIMX = IM1.EXPIMX
                AND IM2.IDDOCIMX = paDocumento
                AND IM2.APPIMX = paSolicitud;

                   IF vlBanderaD = 1 THEN
                   --EXSTE EL DOCUMENTO
                      SELECT MAX(IM3.PAGIMX)+1
                        INTO vlPagimx
                        FROM DIGWEB.IMX03 IM3
                            ,(SELECT IM2.EXPIMX
                                    ,IM2.DOCIMX
                                FROM DIGWEB.IMX02 IM2
                                    ,( SELECT IM.APPIMX
                                             ,IM.EXPIMX
                                         FROM DIGWEB.IMX01 IM
                                        WHERE IM.APPIMX =paSolicitud
                                          AND IM.IMX01 = paCuenta ) IM1
                                WHERE IM2.EXPIMX = IM1.EXPIMX
                                  AND IM2.IDDOCIMX = paDocumento
                                  AND IM2.APPIMX = paSolicitud
                                      ) IM4
                        WHERE IM3.EXPIMX = IM4.EXPIMX
                          AND IM3.DOCIMX = IM4.DOCIMX
                          AND IM3.APPIMX = paSolicitud;

                       SELECT
                     DISTINCT IM3.APPIMX
                             ,IM3.EXPIMX
                             ,IM3.DOCIMX
                         INTO vlAppimx
                             ,vlExpimx
                             ,vlDocimx
                         FROM DIGWEB.IMX03 IM3
                             ,( SELECT IM2.EXPIMX
                                      ,IM2.DOCIMX
                                  FROM DIGWEB.IMX02 IM2
                                      ,( SELECT IM.APPIMX
                                               ,IM.EXPIMX
                                           FROM DIGWEB.IMX01 IM
                                          WHERE IM.APPIMX = paSolicitud
                                            AND IM.IMX01 = paCuenta
                                       ) IM1
                                 WHERE IM2.EXPIMX = IM1.EXPIMX
                                   AND IM2.IDDOCIMX = paDocumento
                                   AND IM2.APPIMX = paSolicitud) IM4
                        WHERE IM3.EXPIMX = IM4.EXPIMX
                          AND IM3.DOCIMX = IM4.DOCIMX
                          AND IM3.APPIMX = paSolicitud;
                           ---VERIFICAMOS QUE EXISTA LA FECHA

                       SELECT COUNT(1)
                         INTO vlExiste
                         FROM DIGWEB.IMX03 IM3
                        WHERE IM3.rutimx
                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                            IF vlExiste > 0 THEN
                            --FECHA ACTUAL
                               OPEN cTemp FOR
                                  SELECT IM3.expimx
                                        ,IM3.imgimx
                                    INTO vlExiste,
                                         vlImg
                                    FROM DIGWEB.IMX03 IM3
                                   WHERE IM3.rutimx
                                    LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;
                                    LOOP
                                   FETCH cTemp INTO vlExpi,vlImg;
                                    EXIT WHEN cTemp%NOTFOUND;
                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                      IF vlCons > vlMaximoF THEN
                                         vlMaximoF := vlCons;
                                         vlMaximoR :=1 + vlMaximoF;
                                      END IF;
                                     END LOOP;
                               CLOSE cTemp;

                              INSERT
                                INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                              VALUES( vlAppimx
                                     ,vlExpimx
                                     ,vlDocimx
                                     ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                     ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                     ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                      COMMIT;
                                 OPEN cCursorsalida FOR
                                    SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                          ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                    RETURN cCursorsalida;
                            ELSE
                            --NO HAY FECHA ACTUAL VERIFICA SI HAY ANTETERIOR O NO HAY REGISTROS
                               SELECT COUNT(1)
                                 INTO vlExiste
                                 FROM DIGWEB.IMX03 IM3
                                WHERE IM3.rutimx
                                 LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                  IF vlExiste > 0 THEN

                                     OPEN cTemp FOR
                                        SELECT IM3.expimx
                                              ,IM3.imgimx
                                          INTO vlExiste,
                                                 vlImg
                                          FROM DIGWEB.IMX03 IM3
                                         WHERE IM3.rutimx
                                          LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;

                                          LOOP
                                             FETCH cTemp INTO vlExpi
                                                             ,vlImg;
                                              EXIT WHEN cTemp%NOTFOUND;
                                                   vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                   vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                IF vlCons > vlMaximoF THEN
                                                   vlMaximoF := vlCons;
                                                   vlMaximoR :=1 + vlMaximoF;
                                               END IF;
                                          END LOOP;
                                     CLOSE cTemp;

                                    INSERT
                                      INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                    VALUES( vlAppimx
                                           ,vlExpimx
                                           ,vlDocimx
                                           ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                           ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                           ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                            COMMIT;
                                       OPEN cCursorsalida FOR
                                          SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                       RETURN cCursorsalida;
                                  ELSE
                                  --NO EXISTEN REGISTROS PONEMOS EL PRIMER CONSECUTIVO
                                     INSERT
                                       INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                     VALUES( vlAppimx
                                            ,vlExpimx
                                            ,vlDocimx
                                            ,vlPagimx  --MAXIMO DEL DOCUMENTO
                                            ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                            ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                             COMMIT;
                                        OPEN cCursorsalida FOR
                                           SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                 ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff') R2 FROM DUAL;
                                           RETURN cCursorsalida;
                                  END IF;
                            END IF;
                                     COMMIT;

                   ELSE
                   --NO EXISTE EL DOCUMENTO


                      IF paEtapa =0 AND paSubproducto = 0 THEN
                      SELECT CATD.fiIdDocumento
                            ,CATD.fcDescDocumento
                        INTO vlFildoc
                            ,vlDescdoc
                        FROM DIGWEB.CATDocumentos CATD
                       WHERE CATD.fiOpeDocumento = paCatODoc
                         AND CATD.fiIdDocumento=paDocumento;

                             ELSE
                         SELECT CATD.fiIdDocumento
                            ,CATD.fcDescDocumento
                        INTO vlFildoc
                            ,vlDescdoc
                        FROM DIGWEB.CATDocumentos CATD
                       WHERE CATD.fiOpeDocumento = paCatODoc
                         AND CATD.fiIdDocumento=paDocumento
                         AND CATD.FISUBPRODUCTO=paSubproducto
                         AND CATD.FIETAPA=paEtapa;
                         END IF;

                      SELECT IM.APPIMX
                            ,IM.EXPIMX
                        INTO vlAppimx
                            ,vlExpimx
                        FROM DIGWEB.IMX01 IM
                       WHERE IM.APPIMX = paSolicitud
                         AND IM.IMX01 = paCuenta;
                   ----------OBTENEMOS CONSECUTIVO
                      SELECT MAX(IM2.DOCIMX)+1
                        INTO vlMaximo
                        FROM DIGWEB.IMX02 IM2
                            ,( SELECT IM.APPIMX
                                     ,IM.EXPIMX
                                 FROM DIGWEB.IMX01 IM
                                WHERE IM.APPIMX = paSolicitud
                                  AND IM.IMX01 = paCuenta
                             ) IM1
                       WHERE IM2.EXPIMX = IM1.EXPIMX
                         AND IM1.APPIMX = IM2.APPIMX;

                          IF vlMaximo IS NOT NULL THEN
                             INSERT
                               INTO DIGWEB.IMX02 (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX)
                             VALUES( vlAppimx
                                    ,vlExpimx
                                    ,vlMaximo
                                    ,vlFildoc
                                    ,vlDescdoc);

                             SELECT COUNT(1)
                               INTO vlExiste
                               FROM DIGWEB.IMX03 IM3
                              WHERE IM3.rutimx
                               LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                                 IF vlExiste > 0 THEN
                                    --FECHA ACTUAL
                                    OPEN cTemp FOR
                                       SELECT IM3.expimx
                                             ,IM3.imgimx
                                         INTO vlExiste,
                                               vlImg
                                         FROM DIGWEB.IMX03 IM3
                                        WHERE IM3.rutimx
                                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;
                                         LOOP
                                            FETCH cTemp INTO vlExpi,vlImg;
                                             EXIT WHEN cTemp%NOTFOUND;
                                                  vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                  vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                               IF vlCons > vlMaximoF THEN
                                                  vlMaximoF := vlCons;
                                                  vlMaximoR :=1 + vlMaximoF;
                                              END IF;
                                         END LOOP;
                                    CLOSE cTemp;

                                   INSERT
                                     INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                   VALUES( vlAppimx
                                          ,vlExpimx
                                          ,vlMaximo
                                          ,1  --MAXIMO DEL DOCUMENTO
                                          ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                          ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                           COMMIT;
                                      OPEN cCursorsalida FOR
                                         SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                               ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                      RETURN cCursorsalida;

                                 ELSE
                                 --NO HAY EFCHA ACTUAL VERIFICAR SI HAY FECHA ANTERIOR O NO HAY REGISTROS
                                    SELECT COUNT(1)
                                      INTO vlExiste
                                      FROM DIGWEB.IMX03 IM3
                                     WHERE IM3.rutimx
                                      LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                        IF vlExiste > 0 THEN
                                           OPEN cTemp FOR
                                              SELECT IM3.expimx
                                                    ,IM3.imgimx
                                                INTO vlExiste,
                                                     vlImg
                                                FROM DIGWEB.IMX03 IM3
                                               WHERE IM3.rutimx
                                                LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;
                                                LOOP
                                                   FETCH cTemp INTO vlExpi
                                                                   ,vlImg;
                                                    EXIT WHEN cTemp%NOTFOUND;
                                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                      IF vlCons > vlMaximoF THEN
                                                         vlMaximoF := vlCons;
                                                         vlMaximoR :=1 + vlMaximoF;
                                                     END IF;
                                                END LOOP;
                                           CLOSE cTemp;

                                          INSERT
                                            INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                          VALUES( vlAppimx
                                                 ,vlExpimx
                                                 ,vlMaximo
                                                 ,1  --MAXIMO DEL DOCUMENTO
                                                 ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                                 ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                                  COMMIT;
                                             OPEN cCursorsalida FOR
                                                SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                      ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                             RETURN cCursorsalida;
                                        ELSE
                                           INSERT
                                             INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                           VALUES( vlAppimx
                                                  ,vlExpimx
                                                  ,vlMaximo
                                                  ,1  --MAXIMO DEL DOCUMENTO
                                                  ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                                  ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                                   COMMIT;
                                              OPEN cCursorsalida FOR
                                                 SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                       ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoF),'.tiff') R2 FROM DUAL;
                                              RETURN cCursorsalida;
                                        END IF;
                                 END IF;

                          ELSE
                             INSERT
                              INTO DIGWEB.IMX02 (APPIMX,EXPIMX,DOCIMX,IDDOCIMX,NOMDOCIMX)
                            VALUES( vlAppimx
                                   ,vlExpimx
                                   ,0
                                   ,vlFildoc
                                   ,vlDescdoc);

                             SELECT COUNT(1)
                               INTO vlExiste
                               FROM DIGWEB.IMX03 IM3
                              WHERE IM3.rutimx
                               LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%';

                                 IF vlExiste > 0 THEN
                                 -- HAY FECHA ACTUAL
                                    OPEN cTemp FOR
                                       SELECT IM3.expimx
                                             ,IM3.imgimx
                                         INTO vlExiste,
                                               vlImg
                                         FROM DIGWEB.IMX03 IM3
                                        WHERE IM3.rutimx
                                         LIKE '%'||TO_CHAR(SYSDATE,'DDMMYY')||'%' ;

                                         LOOP
                                            FETCH cTemp INTO vlExpi
                                                            ,vlImg;
                                             EXIT WHEN cTemp%NOTFOUND;
                                                  vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                  vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                               IF vlCons > vlMaximoF THEN
                                                  vlMaximoF := vlCons;
                                                  vlMaximoR :=1 + vlMaximoF;
                                              END IF;
                                         END LOOP;
                                    CLOSE cTemp;

                                   INSERT
                                     INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                   VALUES( vlAppimx
                                          ,vlExpimx
                                          ,0
                                          ,1  --MAXIMO DEL DOCUMENTO
                                          ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                          ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                           COMMIT;
                                      OPEN cCursorsalida FOR
                                         SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                               ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                      RETURN cCursorsalida;
                                 ELSE
                                 --NO HAY EFCHA ACTUAL VERIFICAR SI HAY FECHA ANTERIOR O NO HAY REGISTROS
                                    SELECT COUNT(1)
                                      INTO vlExiste
                                      FROM DIGWEB.IMX03 IM3
                                     WHERE IM3.rutimx
                                      LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%';

                                        IF vlExiste > 0 THEN
                                           --EXITE FECHA ABNTERIOR
                                           OPEN cTemp FOR
                                              SELECT IM3.expimx
                                                    ,IM3.imgimx
                                                INTO vlExiste,
                                                     vlImg
                                                FROM DIGWEB.IMX03 IM3
                                               WHERE IM3.rutimx
                                                LIKE '%'||TO_CHAR(SYSDATE-1,'DDMMYY')||'%' ;
                                                LOOP
                                                   FETCH cTemp INTO vlExpi
                                                                   ,vlImg;
                                                    EXIT WHEN cTemp%NOTFOUND;
                                                         vlLongitud:=LENGTH(RTRIM(vlExpi));
                                                         vlCons:=TO_NUMBER(LTRIM(TRANSLATE(SUBSTR(vlImg,vlLongitud+1),'.tiff',' ')));
                                                      IF vlCons > vlMaximoF THEN
                                                         vlMaximoF := vlCons;
                                                         vlMaximoR :=1 + vlMaximoF;
                                                     END IF;
                                                END LOOP;
                                           CLOSE cTemp;

                                          INSERT
                                            INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                          VALUES( vlAppimx
                                                 ,vlExpimx
                                                 ,0
                                                 ,1  --MAXIMO DEL DOCUMENTO
                                                 ,CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff')
                                                 ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff'));
                                                  COMMIT;
                                             OPEN cCursorsalida FOR
                                                SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                      ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),vlMaximoR),'.tiff') R2 FROM DUAL;
                                             RETURN cCursorsalida;
                                        ELSE
                                        --NO EXISTEN REGISTROS
                                           INSERT
                                             INTO DIGWEB.IMX03 (APPIMX,EXPIMX,DOCIMX,PAGIMX,IMGIMX,RUTIMX)
                                           VALUES( vlAppimx
                                                  ,vlExpimx
                                                  ,0
                                                  ,1  --MAXIMO DEL DOCUMENTO
                                                  ,CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff')
                                                  ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff'));
                                                   COMMIT;
                                              OPEN cCursorsalida FOR
                                            SELECT paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/' R1
                                                  ,paRutImg||paSolicitud||'/'||TO_CHAR(SYSDATE,'DDMMYY')||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),1),'.tiff') R2 FROM DUAL;
                                            RETURN cCursorsalida;
                                         END IF;
                                 END IF;
                          END IF;
                   END IF;
                      EXCEPTION
                           WHEN OTHERS THEN
                          BEGIN
                                vlError := 1;
                            END;
                      END;

                       IF vlError = 1 THEN
                          ROLLBACK;
                              OPEN cCursorsalida FOR
                                 SELECT 'ERROR' MSG FROM DUAL;
                              RETURN cCursorsalida;
                       END IF;

EXCEPTION
 WHEN OTHERS
   THEN NULL;
END;
/


--
-- TMPFNCLSWLS0016  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0016 ( paSuc        IN IMX01.imx04%TYPE--Departamento
                          ,paSol        IN IMX01.imx05%TYPE--
                          ,paGab        IN IMX01.appimx%TYPE--
                          ,paPagina     IN IMX03.pagimx%TYPE --1
                          ,paArchivo    IN IMX03.imgimx%TYPE --8020502.TIF
                          ,paNomDoc  IN IMX02.nomdocimx%TYPE) --Identificacion del cliente
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: REGRESA NOMBRE ACTUAL Y MODIFICADO DE UNA IMAGEN EN ESPECIDIFO
Par metros de entrada: paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                      ,paCuenta IN IMX01.imx01%TYPE --00120102010201
                      ,paDocumento IN IMX02.iddocimx%TYPE--2, 510,1,33
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 23-OCT-2006
**************************************************************************************************/
cCursorsalida PATYPES.RCGCURSOR;

BEGIN
   OPEN cCursorsalida FOR
      SELECT IM3.rutimx IMG_V,paArchivo IMG_N
                 FROM IMX03 IM3
                     ,( SELECT IM2.EXPIMX
                              ,IM2.DOCIMX
                          FROM IMX02 IM2
                              ,( SELECT IM.APPIMX
                                       ,IM.EXPIMX
                                   FROM IMX01 IM
                                  WHERE IM.IMX04 = paSuc
                                    AND IM.IMX05 = paSol
                                    AND IM.appimx = paGab)  IM1
                          WHERE IM2.EXPIMX = IM1.EXPIMX
                            AND IM2.NOMDOCIMX = paNomDoc
                            AND IM2.APPIMX = paGab) IM4
                          WHERE IM3.EXPIMX = IM4.EXPIMX
                           AND IM3.DOCIMX = IM4.DOCIMX
                           AND IM3.APPIMX = paGab
                           AND IM3.PAGIMX = paPagina;
                 RETURN cCursorsalida;

EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- TMPFNCLSWLS0021  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0021
  (p_SOLICITUD  IN IMX01.APPIMX%TYPE
  ,p_01      IN DIGWEB.IMX01.IMX01%TYPE
  ,p_02      IN DIGWEB.IMX01.IMX02%TYPE
  ,p_03      IN DIGWEB.IMX01.IMX03%TYPE
  ,p_04      IN DIGWEB.IMX01.IMX04%TYPE
  ,p_05      IN DIGWEB.IMX01.IMX05%TYPE
  ,p_06      IN DIGWEB.IMX01.IMX06%TYPE
  ,p_07      IN DIGWEB.IMX01.IMX07%TYPE
  ,p_08      IN DIGWEB.IMX01.IMX08%TYPE
  ,p_09      IN DIGWEB.IMX01.IMX09%TYPE
  ,p_11      IN DIGWEB.IMX01.IMX11%TYPE
  ,p_12      IN DIGWEB.IMX01.IMX12%TYPE
  ,p_13      IN DIGWEB.IMX01.IMX13%TYPE
  ,p_14      IN DIGWEB.IMX01.IMX14%TYPE
  ,p_15      IN DIGWEB.IMX01.IMX15%TYPE
  ,p_16      IN DIGWEB.IMX01.IMX16%TYPE
  )
RETURN PATYPES.RCGCURSOR

IS
 cCursorMsg     PATYPES.RCGCURSOR;
 v_max      NUMBER;
 v_llave     VARCHAR(64);
BEGIN


----

   v_llave:=DIGWEB.FNLLAVEIMX(p_SOLICITUD,p_01,p_02,p_03,p_04,p_05,p_06,p_07,p_08,p_09,p_11,p_12,p_13,p_14,p_15,p_16);


     SELECT NVL(MAX(t.expimx),0)+1
     INTO v_max
     FROM DIGWEB.imx01 t
     WHERE t.appimx=UPPER(p_solicitud);

     
        IF p_SOLICITUD='CASAEMP_WEB' THEN
          BEGIN
                    INSERT INTO DIGWEB.imx01(APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,STATIMAX,IMX11,IMX12,IMX13,IMX14,IMX15,IMX16,FCCLIENTEUNICO)
                    VALUES(UPPER(p_solicitud)
                           ,v_max
                           ,'0'
                           ,'N'
                           ,v_llave
                           ,p_02
                           ,p_03
                           ,p_04
                           ,p_05
                           ,p_06
                           ,p_07
                           ,p_08
                           ,p_09
                           ,TO_CHAR(SYSDATE,'YYMMDDHH24MISS')
                           ,NULL
                           ,p_11
                           ,p_12
                           ,p_13
                           ,p_14
                           ,p_15
                           ,p_16
                           ,p_02
                           );

          END;
        ELSIF p_SOLICITUD='MICRONEGAZTECA_W' THEN
            BEGIN

                    INSERT INTO DIGWEB.imx01(APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,STATIMAX,IMX11,IMX12,IMX13,IMX14,IMX15,IMX16,IMX20)
                    VALUES(UPPER(p_solicitud)
                           ,v_max
                           ,'0'
                           ,'N'
                           ,v_llave
                           ,p_02
                           ,p_03
                           ,p_04
                           ,p_05
                           ,p_06
                           ,p_07
                           ,p_08
                           ,p_09
                           ,TO_CHAR(SYSDATE,'YYMMDDHH24MISS')
                           ,NULL
                           ,p_11
                           ,p_12
                           ,p_13
                           ,p_14
                           ,p_15
                           ,p_16
                           ,v_llave
                           );

            END;
            ELSE
            BEGIN

                    INSERT INTO DIGWEB.imx01(APPIMX,EXPIMX,USOIMX,EDOIMX,IMX01,IMX02,IMX03,IMX04,IMX05,IMX06,IMX07,IMX08,IMX09,IMX10,STATIMAX,IMX11,IMX12,IMX13,IMX14,IMX15,IMX16)
                    VALUES(UPPER(p_solicitud)
                           ,v_max
                           ,'0'
                           ,'N'
                           ,v_llave
                           ,p_02
                           ,p_03
                           ,p_04
                           ,p_05
                           ,p_06
                           ,p_07
                           ,p_08
                           ,p_09
                           ,TO_CHAR(SYSDATE,'YYMMDDHH24MISS')
                           ,NULL
                           ,p_11
                           ,p_12
                           ,p_13
                           ,p_14
                           ,p_15
                           ,p_16
                           );

            END;
        END IF;



      COMMIT;
      OPEN cCursorMsg FOR
            SELECT v_llave MSG
            FROM DUAL;
           RETURN cCursorMsg;
END;
/


--
-- TMPFNCLSWLS0024  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNCLSWLS0024(p_unidad  unidades.fcunidad%TYPE DEFAULT NULL)

RETURN PATYPES.RCGCURSOR

IS

vc_salIP     PATYPES.RCGCURSOR;

BEGIN
     IF p_unidad IS NULL THEN
      OPEN vc_salIP FOR
            SELECT 'E' MSG
            FROM DUAL;
           RETURN vc_salIP;
    ELSE
     OPEN vc_salIP FOR
            SELECT u.fcequvale
            FROM DIGWEB.unidades u
            WHERE u.fcunidad=p_unidad;
           RETURN vc_salIP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
    NULL;

END;
/


--
-- TMPFNDEVIPSERV  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNDEVIPSERV(p_fifromip  cat_ip.FIFROMIP%TYPE DEFAULT NULL)

RETURN PATYPES.RCGCURSOR

IS
/************************************************************************************************
Proyecto:
Descripcion: CREA EXPEDIENTE CON ESTADO N
Par metros de entrada:  p_fifromip  cat_ip.FIFROMIP%TYPE DEFAULT NULL

Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Datos de retorno PATYPES.RCGCURSOR
Desarrollador: José Alfredo Ortega
Fecha: 28-SEP-2006

**************************************************************************************************/


vc_salIP     PATYPES.RCGCURSOR;

BEGIN
     IF p_fifromip IS NULL OR p_fifromip<0  THEN
      OPEN vc_salIP FOR
            SELECT 'E' MSG
            FROM DUAL;
           RETURN vc_salIP;
    ELSE
     OPEN vc_salIP FOR
            SELECT p.fcip_scaner, p.fcip_servelet
            FROM DIGWEB.cat_ip p
            WHERE p.fifromip=p_fifromip;
           RETURN vc_salIP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
    NULL;

END;
/


--
-- TMPFNVALOBL  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFNVALOBL(
                   p_appimx VARCHAR2 DEFAULT NULL
                  ,p_01     DIGWEB.imx01.imx01%TYPE
                  ,p_02     DIGWEB.imx01.imx02%TYPE
                  ,p_03     DIGWEB.imx01.imx03%TYPE
                  ,p_04     DIGWEB.imx01.imx04%TYPE
                  ,p_05     DIGWEB.imx01.imx05%TYPE
                  ,p_06     DIGWEB.imx01.imx06%TYPE
                  ,p_07     DIGWEB.imx01.imx07%TYPE
                  ,p_08     DIGWEB.imx01.imx08%TYPE
                  ,p_09     DIGWEB.imx01.imx09%TYPE
                  ,p_11     DIGWEB.imx01.imx11%TYPE
                  ,p_12     DIGWEB.imx01.imx12%TYPE
                  ,p_13     DIGWEB.imx01.imx13%TYPE
                  ,p_14     DIGWEB.imx01.imx14%TYPE
                  ,p_15     DIGWEB.imx01.imx15%TYPE
                  ,p_16     DIGWEB.imx01.imx16%TYPE
                  )
        RETURN BOOLEAN
IS
/************************************************************************************************
Proyecto:DIGITALIZACION WEB
Descripcion:
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                          paSolicitud  IN IMX01.appimx%TYPE DEFAULT NULL
                         ,p_01         IN IMX01.imx02%TYPE
                         ,p_02         IN IMX01.imx02%TYPE
                         ,p_03         IN IMX01.imx03%TYPE
                         ,p_04         IN IMX01.imx04%TYPE
                         ,p_05         IN IMX01.imx05%TYPE
                         ,p_06         IN IMX01.imx06%TYPE
                         ,p_07         IN IMX01.imx07%TYPE
                         ,p_08         IN IMX01.imx08%TYPE
                         ,p_09         IN IMX01.imx09%TYPE
                         ,p_11         IN IMX01.imx11%TYPE
                         ,p_12         IN IMX01.imx12%TYPE
                         ,p_13         IN IMX01.imx13%TYPE
                         ,p_14         IN IMX01.imx14%TYPE
                         ,p_15         IN IMX01.imx15%TYPE
                         ,p_16         IN IMX01.imx16%TYPE
                         )
Par metros de salida: N/A
Valor de retorno: BOOLEAN
Par metros de entrada-salida: N/A
Datos de retorno BOOLEAN
Desarrollador: JOSE ALFREDO ORTEGA HERNANDEZ (SINERGY SOLUTIONS)
Fecha: 28-SEP-2006
Modificado por: José Alfredo Ortega
Fecha 27-ABR-2007
**************************************************************************/
CURSOR obl_cur (v VARCHAR2) IS
     SELECT 'p_'||SUBSTR(w.fcclumna,4) fcclumna, ROWNUM cant
     FROM DIGWEB.taservcolumn w
     WHERE w.fcdescserv =UPPER(v)
     AND (w.fctipocolumna=UPPER('o')
     OR w.fctipocolumna=UPPER('k'));
obl_reg    obl_cur%ROWTYPE;
v_obl     BOOLEAN:=TRUE;
BEGIN
 OPEN obl_cur(p_appimx);
 LOOP
  FETCH obl_cur INTO obl_reg;
  EXIT WHEN obl_cur%NOTFOUND;

  IF obl_reg.fcclumna='p_01' THEN
     IF p_01 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_02' THEN
     IF p_02 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_03' THEN
    IF p_03 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_04' THEN
     IF p_04 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_05' THEN
     IF p_05 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_06' THEN
     IF p_06 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_07' THEN
     IF p_07 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_08' THEN
     IF p_08 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_09' THEN
     IF p_09 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_11' THEN
     IF p_11 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_12' THEN
     IF p_12 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_13' THEN
     IF p_13 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_14' THEN
     IF p_14 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_15' THEN
     IF p_15 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;

  IF obl_reg.fcclumna='p_16' THEN
     IF p_16 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;
 /* IF obl_reg.fcclumna='p_10' THEN
     IF p_10 IS NULL THEN
        v_obl:=FALSE;
     END IF;
  END IF;*/
 END LOOP;
CLOSE obl_cur;

 OPEN obl_cur(p_appimx);
 FETCH obl_cur INTO obl_reg;
 IF obl_cur%NOTFOUND THEN
 v_obl:=FALSE;
 END IF;
 CLOSE obl_cur;

  RETURN v_obl;

 END;
/


--
-- TMPREGENCIMX  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPREGENCIMX(p_appimx VARCHAR2)
RETURN PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:DIGITALIZACION WEB
Descripcion:
Par metros de entrada:  p_appimx VARCHAR2

Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Datos de retorno PATYPES.RCGCURSOR
Desarrollador: José Alfredo Ortega
Fecha: 28-ABRIL-2007
**************************************************************************************************/

vc_salida     PATYPES.RCGCURSOR;
vc_msg        PATYPES.RCGCURSOR;
v_fila        NUMBER;
BEGIN
 SELECT COUNT(1) FLS
 INTO v_fila
 FROM digweb.encabimx C
 WHERE C.APPIMX=UPPER(p_appimx);

 IF v_fila<=0 THEN
    OPEN vc_msg FOR
         SELECT 'E' msg
         FROM dual;
       RETURN vc_msg;

 ELSE
      OPEN vc_salida FOR
            SELECT c.imx, c.descimx
              FROM digweb.encabimx c
              WHERE c.appimx=UPPER(p_appimx)
              ORDER BY c.ID;
           RETURN vc_salida;

  END IF;
EXCEPTION
WHEN OTHERS THEN
 NULL;

END;
/


--
-- FNDIGCONDOCTOSBASE  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.FNDIGCONDOCTOSBASE (  paFiOpeDocumento  IN CATDOCUMENTOS.fiopedocumento%TYPE
                           ,paAPPIMX          IN  IMX01.APPIMX%TYPE
                           ,paIMX01    IMX01.IMX01%TYPE
                           ,paFisubproducto IN CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                           ,paFietapa    IN CATDOCUMENTOS.FIETAPA%TYPE
                           ,paIMX02    IMX01.IMX02%TYPE)
RETURN  PATYPES.RCGCURSOR
IS
cCursorsalida PATYPES.RCGCURSOR;
csStatus CONSTANT CHAR(1):='D';

BEGIN

OPEN cCursorsalida FOR
SELECT IM22.IDDOCIMX,csStatus status
          FROM IMX01 IM1
         ,( SELECT IM2.EXPIMX
                  ,IM2.IDDOCIMX
              FROM IMX02 IM2
                  ,( SELECT CAT.fiiddocumento
                       FROM DIGWEB.CATDOCUMENTOS CAT, DIGWEB.DOCTOSBASE DOBA
                      WHERE CAT.fiopedocumento = paFiOpeDocumento AND CAT.FIETAPA = paFietapa AND CAT.FISUBPRODUCTO = paFisubproducto
                      AND DOBA.FIDDOCUMENTO<>CAT.FIIDDOCUMENTO) IMC
                      WHERE IM2.APPIMX = paAPPIMX
                        AND IM2.iddocimx = IMC.fiiddocumento
                        AND IM2.FIETAPA = paFietapa
                        AND IM2.FISUBPRODUCTO = paFisubproducto
                        AND IM2.STATUSIMX = 1
                        ) IM22
              WHERE IM1.EXPIMX = IM22.EXPIMX
                AND IM1.imx01 = paIMX01
                AND IM1.APPIMX=paAPPIMX
union
SELECT IM22.IDDOCIMX,csStatus status
          FROM IMX01 IM1
         ,( SELECT IM2.EXPIMX
                  ,IM2.IDDOCIMX
              FROM IMX02 IM2
                  ,( SELECT CAT.fiiddocumento
                       FROM DIGWEB.CATDOCUMENTOS CAT, DIGWEB.DOCTOSBASE DOBA
                      WHERE CAT.fiopedocumento = 101 AND CAT.FIETAPA = paFietapa AND CAT.FISUBPRODUCTO = 1
                      AND DOBA.FIDDOCUMENTO=CAT.FIIDDOCUMENTO) IMC
                      WHERE IM2.APPIMX = paAPPIMX
                        AND IM2.iddocimx = IMC.fiiddocumento
                        AND IM2.FIETAPA = paFietapa
                        AND IM2.FISUBPRODUCTO = paFisubproducto
                        AND IM2.STATUSIMX = 1
                        ) IM22
              WHERE IM1.EXPIMX = IM22.EXPIMX
                AND IM1.imx02 = paIMX02
                AND IM1.APPIMX=paAPPIMX;
RETURN cCursorsalida;
EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- FNDIGCONTOTDOCTOSBASE  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.FNDIGCONTOTDOCTOSBASE (  paFiOpeDocumento  IN CATDOCUMENTOS.fiopedocumento%TYPE
                           ,paAPPIMX          IN  IMX01.APPIMX%TYPE
                           ,paIMX01    IMX01.IMX01%TYPE
                           ,paFisubproducto IN CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                           ,paFietapa    IN CATDOCUMENTOS.FIETAPA%TYPE
                           ,paIMX02    IMX01.IMX02%TYPE)
RETURN  PATYPES.RCGCURSOR
IS
cCursorsalida PATYPES.RCGCURSOR;

BEGIN

OPEN cCursorsalida FOR
select fiddocumento from digweb.doctosbase 
    where fiddocumento in (
        select iddocimx from digweb.imx02 where APPIMX=paAPPIMX and EXPIMX in(                
                SELECT expimx  FROM DIGWEB.IMX01 WHERE FCCLIENTEUNICO = paIMX02 
                and APPIMX=paAPPIMX AND  imx01 <> paIMX01
                )  AND FIETAPA = paFietapa
                   AND FISUBPRODUCTO = paFisubproducto
                   AND STATUSIMX = 1             
        )
and fiopedocumento=paFiOpeDocumento;
                

RETURN cCursorsalida;
EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- FNDIGCONLISTDOCTOSBASE  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.FNDIGCONLISTDOCTOSBASE (  paFiOpeDocumento  IN NUMBER)
RETURN  PATYPES.RCGCURSOR
IS
cCursorsalida PATYPES.RCGCURSOR;

BEGIN

OPEN cCursorsalida FOR
select * from digweb.DOCTOSBASE where fiopedocumento=101;
RETURN cCursorsalida;
EXCEPTION
     WHEN OTHERS THEN
     NULL;
END;
/


--
-- TMPFN14JB  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.TMPFN14JB(
                          paSolicitud   IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                         ,paCuenta      IN DIGWEB.IMX01.IMX01%TYPE--00120102010201
                         ,paCatODoc     IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                         ,paDocumento   IN DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                         ,paRutImg      IN DIGWEB.IMX03.rutimx%TYPE
                         ,paSubproducto IN DIGWEB.CATDOCUMENTOS.FISUBPRODUCTO%TYPE
                         ,paEtapa       IN DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE --c:imagen/imagen.jpg
                         ,pausuarioimx  IN DIGWEB.IMX03.USUARIOIMX%TYPE
                         ,pawsimx       IN DIGWEB.IMX03.WSIMX%TYPE
                         ,paExtension   IN VARCHAR2)
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Descripcion: CREAD DOCUMENTO, AGREGA PAGINAS A DOCUMENTO Y CAMBIA EL ESTADO DEL EXPEDIENTE A M
Par metros de entrada:  paSolicitud IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                       ,paCuenta IN DIGWEB.IMX01.imx01%TYPE--00120102010201
                       ,paCatODoc IN DIGWEB.CATDOCUMENTOS.fiopedocumento%TYPE--CATOperaDoctos 21=>CAPTACION
                       ,paDocumento IN DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE--CATDocumentos 21=>1,2
                       ,paImg DIGWEB.IMX03.imgimx%TYPE--imagen.jpg
                       ,paRutImg DIGWEB.IMX03.rutimx%TYPE) --c:imagen/imagen.jpg
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: ARMANDO OSORIO HERNANDEZ
Fecha:23-07-2009
**************************************************************************************************/
cCursorsalida  PATYPES.RCGCURSOR;
--cTemp          PATYPES.RCGCURSOR;
vlBanderaD     NUMBER;
vlMaximo       NUMBER;
vlAppimx       DIGWEB.IMX03.appimx%TYPE;
vlExpimx       DIGWEB.IMX03.expimx%TYPE;
vlDocimx       DIGWEB.IMX03.docimx%TYPE;
vlPagimx       NUMBER; --Maximo del deocumento
vlDescdoc      DIGWEB.CATDOCUMENTOS.fcdescdocumento%TYPE;
vlFildoc       DIGWEB.CATDOCUMENTOS.fiiddocumento%TYPE; --IDENTIFICADOR DEL TIPO DE DOCUMENTO
vlError        NUMBER;
vlStat         NUMBER; --STATUS IMX02
vlNum          NUMBER; --LOGITUD DEL IMX
vlExt          VARCHAR2(50); --LOGITUD DEL IMX

paEtapa2     DIGWEB.CATDOCUMENTOS.FIETAPA%TYPE; 
FIERROR         NUMBER:=0;


BEGIN

    vlExt := paExtension;
   
    IF LENGTH(vlExt) < 1 THEN
        vlExt := 'tiff';
    END IF;  

    BEGIN
    
        SELECT COUNT(1)  --JA CHECA LA EXISTENCIA DEL DOCUMETO DADO PADOCUMETO
        INTO vlBanderaD  --JA DE ACUERDO A UNA SOLICITUD Y UNA CUENTA
        FROM DIGWEB.IMX02 IM2,(SELECT IM.APPIMX,IM.EXPIMX
                               FROM DIGWEB.IMX01 IM
                               WHERE IM.APPIMX =paSolicitud
                               AND IM.IMX01 = paCuenta) IM1
        WHERE IM2.EXPIMX = IM1.EXPIMX
          AND IM2.APPIMX = IM1.appimx
          AND IM2.IDDOCIMX = paDocumento
          AND IM2.fisubproducto=pasubproducto
          AND IM2.fietapa=paetapa;

        IF vlBanderaD > 0 THEN

            SELECT statusimx  --JA CHECA LA EXISTENCIA DEL DOCUMETO DADO PADOCUMETO
            INTO vlStat  --JA DE ACUERDO A UNA SOLICITUD Y UNA CUENTA
            FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                    FROM DIGWEB.IMX01 IM
                                    WHERE IM.APPIMX =paSolicitud
                                      AND IM.IMX01 = paCuenta) IM1
            WHERE IM2.EXPIMX = IM1.EXPIMX
              AND IM2.APPIMX = IM1.appimx
              AND IM2.IDDOCIMX = paDocumento
              AND IM2.fisubproducto=pasubproducto
              AND IM2.fietapa=paetapa;

            IF vlStat = 0 THEN
                
                SELECT IM.APPIMX,IM.EXPIMX
                INTO vlAppimx,vlExpimx
                FROM DIGWEB.IMX01 IM
                WHERE IM.APPIMX = paSolicitud
                  AND IM.IMX01 = paCuenta;

                UPDATE DIGWEB.IMX02 IM2
                SET  IM2.STATUSIMX =1
                WHERE IM2.APPIMX = paSolicitud
                  AND IM2.expimx = vlExpimx
                  AND IM2.iddocimx = paDocumento
                  AND IM2.fisubproducto=pasubproducto
                  AND IM2.fietapa=paetapa;
                COMMIT;
            
            END IF;

           --EXSTE EL DOCUMENTO --JA TRAE LA CANTIDAD DE PAGINAS DEL DOCUMENTO Y LE AGREGA UNO AL NUEVO
            SELECT NVL(COUNT(IM3.PAGIMX),0)+1
            INTO vlPagimx
            FROM DIGWEB.IMX03 IM3,(SELECT IM2.EXPIMX,IM2.DOCIMX,IM2.FISUBPRODUCTO,IM2.FIETAPA, IM2.APPIMX
                                   FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                                           FROM DIGWEB.IMX01 IM
                                                           WHERE IM.APPIMX =paSolicitud
                                                           AND IM.IMX01 = paCuenta ) IM1
                                   WHERE IM2.EXPIMX = IM1.EXPIMX
                                     AND IM2.APPIMX = IM1.APPIMX
                                     AND IM2.IDDOCIMX = paDocumento
                                     AND IM2.FISUBPRODUCTO=pasubproducto
                                     AND IM2.FIETAPA=paetapa) IM4
            WHERE IM3.EXPIMX = IM4.EXPIMX
              AND IM3.APPIMX = IM4.APPIMX
              AND IM3.DOCIMX = IM4.DOCIMX
              AND IM3.FISUBPRODUCTO=IM4.FISUBPRODUCTO
              AND IM3.FIETAPA=IM4.FIETAPA;

            SELECT NVL(COUNT(IM3.PAGIMX),0)+1
            INTO vlNum
            FROM DIGWEB.IMX03 IM3,(SELECT IM2.EXPIMX,IM2.DOCIMX,IM2.FISUBPRODUCTO,IM2.FIETAPA, IM2.APPIMX
                                   FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                                           FROM DIGWEB.IMX01 IM
                                                           WHERE IM.APPIMX =paSolicitud
                                                             AND IM.IMX01 = paCuenta ) IM1
                                   WHERE IM2.EXPIMX = IM1.EXPIMX
                                     AND IM2.APPIMX = IM1.APPIMX
                                     AND IM2.IDDOCIMX = paDocumento
                                     AND IM2.FISUBPRODUCTO=pasubproducto
                                     AND IM2.FIETAPA=paetapa) IM4
            WHERE IM3.EXPIMX = IM4.EXPIMX
              AND IM3.APPIMX = IM4.APPIMX
              AND IM3.DOCIMX = IM4.DOCIMX
              AND IM3.FISUBPRODUCTO=IM4.FISUBPRODUCTO
              AND IM3.FIETAPA=IM4.FIETAPA
              AND IM3.STATUSIMX=1;
            
            SELECT IM2.DOCIMX
            INTO vlDocimx
            FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                     FROM DIGWEB.IMX01 IM
                                     WHERE IM.APPIMX =paSolicitud
                                       AND IM.IMX01 = paCuenta ) IM1
            WHERE IM2.EXPIMX = IM1.EXPIMX
              AND IM2.APPIMX = IM1.APPIMX
              AND IM2.IDDOCIMX = paDocumento
              AND IM2.FISUBPRODUCTO=pasubproducto
              AND IM2.FIETAPA=paetapa
              AND IM2.statusimx=1;
            
            SELECT IM.APPIMX,IM.EXPIMX
            INTO vlAppimx,vlExpimx
            FROM DIGWEB.IMX01 IM
            WHERE IM.APPIMX = paSolicitud
              AND IM.IMX01 = paCuenta;

            INSERT INTO DIGWEB.IMX03  (APPIMX, EXPIMX, DOCIMX, PAGIMX, IMGIMX, RUTIMX, STATUSIMX, FISUBPRODUCTO, FIETAPA, USUARIOIMX, WSIMX, FECDICIMX)
             VALUES( paSolicitud
                    ,vlExpimx
                    ,vlDocimx
                    ,vlPagimx  --MAXIMO DEL DOCUMENTO
                    ,CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlNum),4,0))),'.'||vlExt)
                    ,paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlNum),4,0))),'.'||vlExt)
                    ,1
                    ,paSubproducto
                    ,paEtapa
                    ,pausuarioimx
                    ,pawsimx
                    ,SYSDATE);
            COMMIT;

            OPEN cCursorsalida FOR
              SELECT paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/' R1
                    ,paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlNum),4,0))),'.'||vlExt) R2 FROM DUAL;
            RETURN cCursorsalida;
    
        ELSE  
  
            IF paSolicitud='CREDITO_WEB' THEN
            BEGIN
            
                IF paSolicitud='CREDITO_WEB' AND  paDocumento = '356' THEN
                    paEtapa2:='4';
                ELSIF paSolicitud='CREDITO_WEB' AND  (paDocumento = '282' OR paDocumento = '283')THEN
                    paEtapa2:='9';
                ELSIF paSolicitud='CREDITO_WEB' AND  (paDocumento = '389' OR paDocumento = '390')THEN
                    paEtapa2:='11';
                ELSIF paSolicitud='CREDITO_WEB' AND  (paDocumento = '146' OR paDocumento = '384' OR paDocumento = '385' OR paDocumento = '139' OR paDocumento = '386' OR paDocumento = '387'  OR paDocumento = '388')THEN
                    paEtapa2:='10';
                ELSIF paSolicitud='CREDITO_WEB' AND  (paDocumento = '424' OR paDocumento = '401' OR paDocumento = '416' OR paDocumento = '132' OR paDocumento = '3')THEN
                    paEtapa2:='13';
                ELSIF paSolicitud='CREDITO_WEB' AND  paDocumento = '247' THEN
                    paEtapa2:='14';
                ELSE
                    paEtapa2:='1';
                END IF;

                SELECT CATD.fiIdDocumento,CATD.fcDescDocumento
                   INTO vlFildoc,vlDescdoc
                   FROM DIGWEB.CATDOCUMENTOS CATD
                   WHERE CATD.fiOpeDocumento = paCatODoc
                   AND CATD.fiIdDocumento=paDocumento
                   AND (CATD.FISUBPRODUCTO=1 OR CATD.FISUBPRODUCTO=2)
                       AND CATD.FIETAPA=paEtapa2
                   GROUP BY CATD.fiIdDocumento,CATD.fcDescDocumento;

            END;
          
            ELSE          
            BEGIN

                SELECT CATD.fiIdDocumento,CATD.fcDescDocumento
                INTO vlFildoc,vlDescdoc
                FROM DIGWEB.CATDOCUMENTOS CATD
                WHERE CATD.fiOpeDocumento = paCatODoc
                  AND CATD.fiIdDocumento=paDocumento
                  AND CATD.FISUBPRODUCTO=paSubproducto
                  AND CATD.FIETAPA=paEtapa;

            END;
            
            END IF;

            SELECT IM.APPIMX,IM.EXPIMX
            INTO vlAppimx,vlExpimx
            FROM DIGWEB.IMX01 IM
            WHERE IM.APPIMX = paSolicitud
              AND IM.IMX01 = paCuenta;
             ----------OBTENEMOS CONSECUTIVO
            
            SELECT NVL(MAX(IM2.DOCIMX),0)+1
            INTO vlMaximo
            FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                    FROM DIGWEB.IMX01 IM
                                    WHERE IM.APPIMX = paSolicitud
                                      AND IM.IMX01 = paCuenta) IM1
            WHERE IM2.EXPIMX = IM1.EXPIMX
              AND IM1.APPIMX = IM2.APPIMX;
    

            INSERT INTO DIGWEB.IMX02 (APPIMX, EXPIMX, DOCIMX, IDDOCIMX, NOMDOCIMX, STATUSIMX, FISUBPRODUCTO, FIETAPA)
            VALUES( vlAppimx
                    ,vlExpimx
                    ,vlMaximo
                    ,vlFildoc
                    ,vlDescdoc
                    ,1
                    ,paSubproducto
                    ,paEtapa
                  );
            
            COMMIT;

            SELECT NVL(MAX(IM3.PAGIMX),0)+1
            INTO vlPagimx
            FROM DIGWEB.IMX03 IM3,(SELECT IM2.EXPIMX,IM2.DOCIMX,IM2.FISUBPRODUCTO,IM2.FIETAPA, IM2.APPIMX
                                   FROM DIGWEB.IMX02 IM2,( SELECT IM.APPIMX,IM.EXPIMX
                                                           FROM DIGWEB.IMX01 IM
                                                           WHERE IM.APPIMX =paSolicitud
                                                             AND IM.IMX01 = paCuenta ) IM1
                                   WHERE IM2.EXPIMX = IM1.EXPIMX
                                     AND IM2.APPIMX = IM1.APPIMX
                                     AND IM2.IDDOCIMX = paDocumento
                                     AND IM2.FISUBPRODUCTO=pasubproducto
                                     AND IM2.FIETAPA=paetapa) IM4
            WHERE IM3.EXPIMX = IM4.EXPIMX
              AND IM3.APPIMX = IM4.APPIMX
              AND IM3.DOCIMX = IM4.DOCIMX
              AND IM3.FISUBPRODUCTO=IM4.FISUBPRODUCTO
              AND IM3.FIETAPA=IM4.FIETAPA;



            INSERT INTO DIGWEB.IMX03 (APPIMX, EXPIMX, DOCIMX, PAGIMX, IMGIMX, RUTIMX, STATUSIMX, FISUBPRODUCTO, FIETAPA, USUARIOIMX, WSIMX, FECDICIMX)
            VALUES( vlAppimx
                    ,vlExpimx
                    ,vlMaximo
                    ,vlPagimx  --MAXIMO DEL DOCUMENTO
                    ,CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlPagimx),4,0))),'.'|| vlExt)
                    ,paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlPagimx),4,0))),'.' || vlExt)
                    ,1
                    ,paSubproducto
                    ,paEtapa
                    ,pausuarioimx
                    ,pawsimx
                    ,SYSDATE);
            COMMIT;


            OPEN cCursorsalida FOR
              SELECT paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/' R1
                    ,paRutImg||paSolicitud||'/'||pacuenta||'/'||pacuenta||'-'||pasubproducto||'-'||paetapa||'/'||paDocumento||'/'||CONCAT(CONCAT(TO_CHAR(vlExpimx),(LPAD(TO_CHAR(vlPagimx),4,0))),'.' || vlExt) R2 FROM DUAL;
            RETURN cCursorsalida;

          END IF;
    END;
    
    EXCEPTION
    WHEN OTHERS THEN
        BEGIN
            FIERROR := 1;
        END;
        
    IF FIERROR = 1 THEN
        ROLLBACK;
            OPEN cCursorsalida FOR
                SELECT 'ERROR' MSG FROM DUAL;
            RETURN cCursorsalida;
    END IF;

END;
/


--
-- TMPFNCLSWLS0002JA  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.tmpfnclswls0002JA(
                          paSolicitud  IN DIGWEB.IMX01.appimx%TYPE DEFAULT NULL
                         ,p_01         IN DIGWEB.IMX01.imx01%TYPE
                         ,p_02         IN DIGWEB.IMX01.imx02%TYPE
                         ,p_03         IN DIGWEB.IMX01.imx03%TYPE
                         ,p_04         IN DIGWEB.IMX01.imx04%TYPE
                         ,p_05         IN DIGWEB.IMX01.imx05%TYPE
                         ,p_06         IN DIGWEB.IMX01.imx06%TYPE
                         ,p_07         IN DIGWEB.IMX01.imx07%TYPE
                         ,p_08         IN DIGWEB.IMX01.imx08%TYPE
                         ,p_09         IN DIGWEB.IMX01.imx09%TYPE
                         ,p_10         IN DIGWEB.IMX01.imx10%TYPE DEFAULT TO_CHAR(SYSDATE,'DDMMYYHH24MISS' )
                         ,p_11         IN DIGWEB.IMX01.imx11%TYPE
                         ,p_12         IN DIGWEB.IMX01.imx12%TYPE
                         ,p_13         IN DIGWEB.IMX01.imx13%TYPE
                         ,p_14         IN DIGWEB.IMX01.imx14%TYPE
                         ,p_15         IN DIGWEB.IMX01.imx15%TYPE
                         ,p_16         IN DIGWEB.IMX01.imx16%TYPE


                         )--Inicializado por default a la fecha
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: CREA EXPEDIENTE CON ESTADO N
Par metros de entrada:  paSolicitud IN DIGWEB.IMX01.appimx%TYPE--CAPTACION
                          ,paCuenta IN DIGWEB.IMX01.imx01%TYPE--00120102010201
                          ,paIMX02 IN DIGWEB.IMX01.imx02%TYPE
                          ,paIMX03 IN DIGWEB.IMX01.imx03%TYPE
                          ,paIMX04 IN DIGWEB.IMX01.imx04%TYPE
                          ,paIMX05 IN DIGWEB.IMX01.imx05%TYPE
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
**************************************************************************************************/

cCursorMsg     PATYPES.RCGCURSOR;
vlMaximo       NUMBER;
vlExiste       NUMBER;

---
v_llave     VARCHAR2(50);
v_usoimx    VARCHAR2(1):='0';
v_edoimx    VARCHAR2(1):='N';
sql_stmt    VARCHAR2(200);
v_coblig    BOOLEAN;
---

 BEGIN
 v_coblig:=digweb.tmpfnvalobl(paSolicitud,p_01,p_02,p_03,p_04,p_05,p_06,p_07,p_08,p_09,p_11,p_12,p_13,p_14,p_15,p_16);



  IF paSolicitud IS NULL OR v_coblig=FALSE THEN
      OPEN cCursorMsg FOR
            SELECT 'E' MSG
            FROM DUAL;
           RETURN cCursorMsg;


 ELSE
     BEGIN
        --generacion de llave y verificacion de datos
      v_llave:=DIGWEB.FNLLAVEIMX(paSolicitud,p_01,p_02,p_03,p_04,p_05,p_06,p_07,p_08,p_09,p_11,p_12,p_13,p_14,p_15,p_16);
      v_llave:=UPPER(v_llave);
        /***********************************************************/

        SELECT COUNT(1) INTO vlExiste
         FROM DIGWEB.IMX01 IM
         WHERE IM.APPIMX = UPPER(paSolicitud)
          AND IM.IMX01 = v_llave;

       IF vlExiste = 0 THEN
           SELECT MAX(IM.EXPIMX)+1
           INTO vlMaximo
             FROM DIGWEB.IMX01 IM
            WHERE IM.APPIMX = UPPER(paSolicitud);

           IF vlMaximo IS NULL THEN
               vlMaximo:= 1;
           END IF;

               sql_stmt:= 'INSERT INTO DIGWEB.imx01 VALUES(:v_appimx,:v_expimx, :v_usoimx, :v_edoimx, :v_llave,:p_02, :p_03, :p_04, :p_05, :p_06, :p_07, :p_08, :p_09, :p_10, :p_11,:p_12, :p_13, :p_14, :p_15, :p_16 )';
               EXECUTE IMMEDIATE sql_stmt USING UPPER(paSolicitud), vlmaximo, v_usoimx, v_edoimx, v_llave, UPPER(p_02), UPPER(p_03), UPPER(p_04), UPPER(p_05), UPPER(p_06), UPPER(p_07), UPPER(p_08), UPPER(p_09), UPPER(p_10), UPPER(p_11), UPPER(p_12), UPPER(p_13), UPPER(p_14), UPPER(p_15), UPPER(p_16);
             COMMIT;

             OPEN cCursorMsg FOR
                  SELECT IMX01 MSG
                  FROM digweb.IMX01 m
                  WHERE m.imx01=v_llave;
             RETURN cCursorMsg;
       ELSE
         OPEN cCursorMsg FOR
          SELECT imx01
          FROM digweb.IMX01 m
          WHERE m.imx01=v_llave;
        RETURN cCursorMsg;
       END IF;
      END;
   END IF;

EXCEPTION
    WHEN OTHERS THEN

      OPEN cCursorMsg FOR
          SELECT imx01
          FROM digweb.IMX01 m
          WHERE m.imx01=v_llave;
        RETURN cCursorMsg;

END;
/


--
-- TMPFNCLSWLS0002JA1  (Function) 
--
CREATE OR REPLACE FUNCTION DIGWEB.tmpfnclswls0002JA1(
                          paSolicitud  IN DIGWEB.IMX01.appimx%TYPE DEFAULT NULL
                         ,p_01         IN DIGWEB.IMX01.imx02%TYPE
                         ,p_02         IN DIGWEB.IMX01.imx02%TYPE
                         ,p_03         IN DIGWEB.IMX01.imx03%TYPE
                         ,p_04         IN DIGWEB.IMX01.imx04%TYPE
                         ,p_05         IN DIGWEB.IMX01.imx05%TYPE
                         ,p_06         IN DIGWEB.IMX01.imx06%TYPE
                         ,p_07         IN DIGWEB.IMX01.imx07%TYPE
                         ,p_08         IN DIGWEB.IMX01.imx08%TYPE
                         ,p_09         IN DIGWEB.IMX01.imx09%TYPE
                         ,p_11         IN DIGWEB.IMX01.imx11%TYPE
                         ,p_12         IN DIGWEB.IMX01.imx12%TYPE
                         ,p_13         IN DIGWEB.IMX01.imx13%TYPE
                         ,p_14         IN DIGWEB.IMX01.imx14%TYPE
                         ,p_15         IN DIGWEB.IMX01.imx15%TYPE
                         ,p_16         IN DIGWEB.IMX01.imx16%TYPE
                         )
RETURN  PATYPES.RCGCURSOR
IS
/************************************************************************************************
Proyecto:
Descripcion: CREA EXPEDIENTE CON ESTADO N
Par metros de entrada:  paSolicitud IN IMX01.appimx%TYPE--CAPTACION
                          paSolicitud  IN IMX01.appimx%TYPE DEFAULT NULL
                         ,p_01         IN IMX01.imx02%TYPE
                         ,p_02         IN IMX01.imx02%TYPE
                         ,p_03         IN IMX01.imx03%TYPE
                         ,p_04         IN IMX01.imx04%TYPE
                         ,p_05         IN IMX01.imx05%TYPE
                         ,p_06         IN IMX01.imx06%TYPE
                         ,p_07         IN IMX01.imx07%TYPE
                         ,p_08         IN IMX01.imx08%TYPE
                         ,p_09         IN IMX01.imx09%TYPE
                         ,p_11         IN IMX01.imx11%TYPE
                         ,p_12         IN IMX01.imx12TYPE
                         ,p_13         IN IMX01.imx13%TYPE
                         ,p_14         IN IMX01.imx14%TYPE
                         ,p_15         IN IMX01.imx15%TYPE
                         ,p_16         IN IMX01.imx16%TYPE
                         )
Par metros de salida: N/A
Valor de retorno: Cursor con los datos
Par metros de entrada-salida: N/A
Datos de retorno PATYPES.RCGCURSOR
Desarrollador: HECTOR FRANCISCO POLANCO CARRERA
Fecha: 28-SEP-2006
Modificado por: José Alfredo Ortega
Fecha 27-ABR-2007

**************************************************************************************************/

cCursorMsg     PATYPES.RCGCURSOR;
vlExiste       NUMBER;
---
v_llave     VARCHAR(64);
v_coblig    BOOLEAN;

 BEGIN
 v_coblig:=DIGWEB.tmpfnvalobl(paSolicitud,p_01,p_02,p_03,p_04,p_05,p_06,p_07,p_08,p_09,p_11,p_12,p_13,p_14,p_15,p_16);

  IF paSolicitud IS NULL OR v_coblig=FALSE THEN
      OPEN cCursorMsg FOR
            SELECT 'O' MSG
            FROM DUAL;
           RETURN cCursorMsg;

  ELSE
     BEGIN
        --generacion de llave y verificacion de datos
      v_llave:=DIGWEB.FNLLAVEIMX(paSolicitud,p_01,p_02,p_03,p_04,p_05,p_06,p_07,p_08,p_09,p_11,p_12,p_13,p_14,p_15,p_16);
      v_llave:=UPPER(v_llave);
        /***********************************************************/

        SELECT COUNT(1)
        INTO vlExiste
         FROM DIGWEB.IMX01 IM
         WHERE IM.APPIMX = UPPER(paSolicitud)
          AND IM.IMX01 = v_llave;

       IF vlExiste > 0 THEN

         OPEN cCursorMsg FOR
                  SELECT m.imx01, m.statimax
                  FROM DIGWEB.IMX01 m
                  WHERE m.imx01=v_llave;
             RETURN cCursorMsg;
       ELSE
         OPEN cCursorMsg FOR
          SELECT 'E' MSG
            FROM DUAL;
           RETURN cCursorMsg;
       END IF;
      END;
   END IF;

EXCEPTION
    WHEN OTHERS THEN

      NULL;

END;
/


-- 
-- Non Foreign Key Constraints for Table CATDESCDOCUMENTOS 
-- 
ALTER TABLE DIGWEB.CATDESCDOCUMENTOS ADD (
  CONSTRAINT PK001CATDESCDOCUMENTOS
  PRIMARY KEY
  (FIIDDOCUMENTO)
  USING INDEX DIGWEB.PK001CATDESCDOCUMENTOS)
/


-- 
-- Non Foreign Key Constraints for Table CATDIGSCANNER 
-- 
ALTER TABLE DIGWEB.CATDIGSCANNER ADD (
  CONSTRAINT PK001CATDIGSCANNER
  PRIMARY KEY
  (FIIDSCANNER)
  USING INDEX DIGWEB.PK001CATDIGSCANNER)
/


-- 
-- Non Foreign Key Constraints for Table CATDIGTEMPLATE 
-- 
ALTER TABLE DIGWEB.CATDIGTEMPLATE ADD (
  CONSTRAINT PK001CATDIGTEMPLATE
  PRIMARY KEY
  (FIIDTEMPLATE, FIIDSCANNER)
  USING INDEX DIGWEB.PK001CATDIGTEMPLATE)
/


-- 
-- Non Foreign Key Constraints for Table CATDOCIDIOMA 
-- 
ALTER TABLE DIGWEB.CATDOCIDIOMA ADD (
  CONSTRAINT CATDOCIDIOMA_PK
  PRIMARY KEY
  (IDMSJ)
  USING INDEX DIGWEB.CATDOCIDIOMA_PK)
/


-- 
-- Non Foreign Key Constraints for Table CATDOCIMAX 
-- 
ALTER TABLE DIGWEB.CATDOCIMAX ADD (
  CONSTRAINT PK001CATDOCIMAX
  PRIMARY KEY
  (FCPRODUCTO, FIIDDIGWEB)
  USING INDEX DIGWEB.PK001CATDOCIMAX)
/


-- 
-- Non Foreign Key Constraints for Table CATDOCUMENTOS 
-- 
ALTER TABLE DIGWEB.CATDOCUMENTOS ADD (
  CONSTRAINT PK001CATDOCUMENTOS
  PRIMARY KEY
  (FIOPEDOCUMENTO, FIIDDOCUMENTO, FISUBPRODUCTO, FIETAPA)
  USING INDEX DIGWEB.PK001CATDOCUMENTOS)
/


-- 
-- Non Foreign Key Constraints for Table CATIDIOMA 
-- 
ALTER TABLE DIGWEB.CATIDIOMA ADD (
  CONSTRAINT CATIDIOMA_PK
  PRIMARY KEY
  (IDIDIOMA)
  USING INDEX DIGWEB.CATIDIOMA_PK)
/


-- 
-- Non Foreign Key Constraints for Table CATOPERADOCTOS 
-- 
ALTER TABLE DIGWEB.CATOPERADOCTOS ADD (
  CONSTRAINT PK001CATOPERADOCTOS
  PRIMARY KEY
  (FIOPEDOCUMENTO)
  USING INDEX DIGWEB.PK001CATOPERADOCTOS)
/


-- 
-- Non Foreign Key Constraints for Table DESCHEADERS 
-- 
ALTER TABLE DIGWEB.DESCHEADERS ADD (
  CONSTRAINT PK_DESCHEADER
  PRIMARY KEY
  (IDTABLA)
  USING INDEX DIGWEB.PK_DESCHEADER)
/


-- 
-- Non Foreign Key Constraints for Table DESC_LOG 
-- 
ALTER TABLE DIGWEB.DESC_LOG ADD (
  CONSTRAINT PK001DESC_LOG
  PRIMARY KEY
  (ID_DESC)
  USING INDEX DIGWEB.PK001DESC_LOG)
/


-- 
-- Non Foreign Key Constraints for Table DIGSCANTMPL 
-- 
ALTER TABLE DIGWEB.DIGSCANTMPL ADD (
  CONSTRAINT PK001DIGSCANTMPL
  PRIMARY KEY
  (FIIDTEMPLATE, FIIDSCANNER, FIOPEDOCUMENTO)
  USING INDEX DIGWEB.PK001DIGSCANTMPL)
/


-- 
-- Non Foreign Key Constraints for Table DIG_UNIDAD_VOLUMEN 
-- 
ALTER TABLE DIGWEB.DIG_UNIDAD_VOLUMEN ADD (
  CONSTRAINT PK_UNIDAD_VOLUMEN
  PRIMARY KEY
  (UNIDAD, RUTA_BASE)
  USING INDEX DIGWEB.PK_UNIDAD_VOLUMEN)
/


-- 
-- Non Foreign Key Constraints for Table DOCTOSBASE 
-- 
ALTER TABLE DIGWEB.DOCTOSBASE ADD (
  CONSTRAINT PK001DOCTOSBASE
  PRIMARY KEY
  (FIOPEDOCUMENTO, FIDDOCUMENTO)
  USING INDEX DIGWEB.PK001DOCTOSBASE)
/


-- 
-- Non Foreign Key Constraints for Table ENCABEZADO 
-- 
ALTER TABLE DIGWEB.ENCABEZADO ADD (
  PRIMARY KEY
  (APPIMX, RUTA)
  USING INDEX
    TABLESPACE TBS_DIGWB_DATA01_DAT)
/


-- 
-- Non Foreign Key Constraints for Table ENCABIMX 
-- 
ALTER TABLE DIGWEB.ENCABIMX ADD (
  PRIMARY KEY
  (ID, APPIMX, IMX, DESCIMX)
  USING INDEX
    TABLESPACE TBS_DIGWB_DATA01_DAT)
/


-- 
-- Non Foreign Key Constraints for Table ENVEXPTER 
-- 
ALTER TABLE DIGWEB.ENVEXPTER ADD (
  PRIMARY KEY
  (APPIMX, URL)
  USING INDEX
    TABLESPACE TBS_DIGWB_DATA01_DAT)
/


-- 
-- Non Foreign Key Constraints for Table IMX01 
-- 
ALTER TABLE DIGWEB.IMX01 ADD (
  CONSTRAINT PK_IMX01
  PRIMARY KEY
  (APPIMX, EXPIMX)
  USING INDEX DIGWEB.PK_IMX01)
/


-- 
-- Non Foreign Key Constraints for Table IMX02 
-- 
ALTER TABLE DIGWEB.IMX02 ADD (
  CONSTRAINT PK_IMX02
  PRIMARY KEY
  (APPIMX, EXPIMX, DOCIMX)
  USING INDEX DIGWEB.PK_IMX02)
/


-- 
-- Non Foreign Key Constraints for Table IMX03 
-- 
ALTER TABLE DIGWEB.IMX03 ADD (
  CONSTRAINT PK_IMX03
  PRIMARY KEY
  (APPIMX, EXPIMX, DOCIMX, PAGIMX)
  USING INDEX DIGWEB.PK_IMX03)
/


-- 
-- Non Foreign Key Constraints for Table ORDERDOCS 
-- 
ALTER TABLE DIGWEB.ORDERDOCS ADD (
  CONSTRAINT PK_ORDERDOCS
  PRIMARY KEY
  (ORDERDOC, FIOPEDOCUMENTO, FIETAPA, FISUBPRODUCTO)
  USING INDEX DIGWEB.PK_ORDERDOCS)
/


-- 
-- Non Foreign Key Constraints for Table TADGBITACORACHEQUEMOVIL 
-- 
ALTER TABLE DIGWEB.TADGBITACORACHEQUEMOVIL ADD (
  CONSTRAINT PKBITACORACHEQUEMOVIL
  PRIMARY KEY
  (FCPRODUCTO, FCBANDACHQ, FCSERIAL)
  USING INDEX DIGWEB.IX001BITACORACHEQUEMOVIL)
/


-- 
-- Non Foreign Key Constraints for Table TADGDATOSPAD 
-- 
ALTER TABLE DIGWEB.TADGDATOSPAD ADD (
  CONSTRAINT PK1TADGDATOSPAD
  PRIMARY KEY
  (FIIDREG, FINOPAG, FISOLICITUD, FCDESCCAMPO)
  USING INDEX DIGWEB.IDX1TADGDATOSPAD)
/


-- 
-- Non Foreign Key Constraints for Table TADGENCABEZADOVISOR 
-- 
ALTER TABLE DIGWEB.TADGENCABEZADOVISOR ADD (
  CONSTRAINT IXPKTADGENCABEZADOVISOR
  PRIMARY KEY
  (FIIDENCABEZADO, FISERIAL)
  USING INDEX DIGWEB.IX0001ENCABEZADOVISOR)
/


-- 
-- Non Foreign Key Constraints for Table TASERVCOLUMN 
-- 
ALTER TABLE DIGWEB.TASERVCOLUMN ADD (
  CONSTRAINT FCTIPOCOL_CK
  CHECK (fctipocolumna IN ('K', 'O', 'P')))
/

ALTER TABLE DIGWEB.TASERVCOLUMN ADD (
  PRIMARY KEY
  (FCDESCSERV, FCCLUMNA, FCTIPOCOLUMNA)
  USING INDEX
    TABLESPACE TBS_DIGWB_DATA01_DAT)
/


-- 
-- Non Foreign Key Constraints for Table TASERVICIOSDG 
-- 
ALTER TABLE DIGWEB.TASERVICIOSDG ADD (
  PRIMARY KEY
  (FCDESCSERV)
  USING INDEX
    TABLESPACE TBS_DIGWB_DATA01_DAT)
/


-- 
-- Non Foreign Key Constraints for Table TCCATCONTRATOS 
-- 
ALTER TABLE DIGWEB.TCCATCONTRATOS ADD (
  CONSTRAINT PK1TCCATCONTRATOS
  PRIMARY KEY
  (FCPRODUCTO, FIIDCONTRATO, FCIDCONTRATO)
  USING INDEX DIGWEB.IDX1TCCATCONTRATOS)
/


-- 
-- Non Foreign Key Constraints for Table TCCATCORDENADAS 
-- 
ALTER TABLE DIGWEB.TCCATCORDENADAS ADD (
  CONSTRAINT PK1TCCATCORDENADAS
  PRIMARY KEY
  (FIIDREG, FINOPAG, FCDESCCAMPO)
  USING INDEX DIGWEB.IDX1TCCATCORDENADAS)
/


-- 
-- Non Foreign Key Constraints for Table TCCATDETCONTRATOS 
-- 
ALTER TABLE DIGWEB.TCCATDETCONTRATOS ADD (
  CONSTRAINT PK1TCCATDETCONTRATOS
  PRIMARY KEY
  (FIIDREG, FINOPAG)
  USING INDEX DIGWEB.IDX1TCCATDETCONTRATOS)
/


-- 
-- Non Foreign Key Constraints for Table TCDGTERMINALCHQMOVIL 
-- 
ALTER TABLE DIGWEB.TCDGTERMINALCHQMOVIL ADD (
  CONSTRAINT PKCATDGTERMINALCHQMOVIL
  PRIMARY KEY
  (FIIDTERMINAL, FCTERMINAL)
  USING INDEX DIGWEB.IX001TCDGTERMINALCHQMOVIL)
/


-- 
-- Non Foreign Key Constraints for Table UNIDADES 
-- 
ALTER TABLE DIGWEB.UNIDADES ADD (
  PRIMARY KEY
  (FCUNIDAD)
  USING INDEX
    TABLESPACE TBS_DIGWB_DATA01_DAT)
/


-- 
-- Foreign Key Constraints for Table CATDIGTEMPLATE 
-- 
ALTER TABLE DIGWEB.CATDIGTEMPLATE ADD (
  CONSTRAINT FK001CATDIGTEMPLATE 
  FOREIGN KEY (FIIDSCANNER) 
  REFERENCES DIGWEB.CATDIGSCANNER (FIIDSCANNER))
/


-- 
-- Foreign Key Constraints for Table DIGSCANTMPL 
-- 
ALTER TABLE DIGWEB.DIGSCANTMPL ADD (
  CONSTRAINT FK001DIGSCANTMPL 
  FOREIGN KEY (FIIDTEMPLATE, FIIDSCANNER) 
  REFERENCES DIGWEB.CATDIGTEMPLATE (FIIDTEMPLATE,FIIDSCANNER))
/


-- 
-- Foreign Key Constraints for Table ORDERDOCS 
-- 
ALTER TABLE DIGWEB.ORDERDOCS ADD (
  CONSTRAINT FK_ORDER_HEADER 
  FOREIGN KEY (IDTABLA) 
  REFERENCES DIGWEB.DESCHEADERS (IDTABLA))
/


GRANT SELECT ON DIGWEB.CATDESCDOCUMENTOS TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.CATDOCIDIOMA TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.CATDOCUMENTOS TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.CATDOCUMENTOSTMP TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.CATIDIOMA TO USRDIGWEB
/

GRANT SELECT, UPDATE ON DIGWEB.CAT_IP TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.CATOPERADOCTOS TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.DAENCABEZADO TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.DAEXPIMX TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.DESCHEADERS TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.DESC_LOG TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.ENCABEZADO TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.ENCABIMX TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.ENVEXP TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.ENVEXPPARAM TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.ENVEXPTER TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.FNDIGCONDOCTOSBASE TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.FNDIGCONLISTDOCTOSBASE TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.FNDIGCONTOTDOCTOSBASE TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.FNLLAVEIMX TO USRDIGWEB
/

GRANT DELETE, INSERT, SELECT, UPDATE ON DIGWEB.IMX01 TO USRDIGWEB
/

GRANT DELETE, INSERT, SELECT, UPDATE ON DIGWEB.IMX02 TO USRDIGWEB
/

GRANT DELETE, INSERT, SELECT, UPDATE ON DIGWEB.IMX03 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.INSERT_LOG TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.INSERT_LOGS TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.LOGS_DIGITALIZA TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.ORDERDOCS TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PATYPES TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGABCCONTRATOSX TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGABCDOCTOS_BASE TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGABCWEB TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGCATDOCIMAX TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGCAT_IP TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGITALIZADOCTOS TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGORDERDOCS TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGSCANTMPL TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGUNIDADVOLUMEN TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PKDIGVISOR TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGABCDIGDOCWEB TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGABCDIGWEB TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGBITACORACHEQUEMOVIL TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGCARGADOCTOS TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGCHEQUESBC TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGDIGVISORUNICO TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGDOCTOSWI TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGDOMICILIA TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGMANTIMX01 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGTCDGCHQDEV TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGTENCABEZADOVISOR TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGTGETRUTAS TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGURECHUM TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PQDGVISORWEB TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.PRU TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.RESULTADO TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.TASERVCOLUMN TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.TASERVICIOSDG TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPDAFECHA TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPDEVDOCTRA TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPDEVURL TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPDEVURL2 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0001 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0001P TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS00014 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0002 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0002JA TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0002JA1 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0003 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0003P TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0004 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0004JA TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0004JAB TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0004JAC TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0004JAD TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0004JAE TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0004P TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0005 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0006 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0007 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0008 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0008B TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0009 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0010 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0011 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0012 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0013 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0014 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0016 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0021 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0024 TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNDEVIPSERV TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFNVALOBL TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFN14JA TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPFN14JB TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPREGENCIMX TO USRDIGWEB
/

GRANT EXECUTE ON DIGWEB.TMPSPCLSWL0020 TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.UNIDADES TO USRDIGWEB
/

GRANT SELECT ON DIGWEB.IMX01 TO USRJOBCREATOR
/

GRANT SELECT ON DIGWEB.IMX02 TO USRJOBCREATOR
/

GRANT SELECT ON DIGWEB.IMX03 TO USRJOBCREATOR
/

GRANT EXECUTE ON DIGWEB.TMPFNCLSWLS0002 TO USRMIDIG
/