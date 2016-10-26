package com.kt.bdapportal.common.util;

import java.io.Serializable;
import java.util.Properties;

import org.hibernate.MappingException;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.UUIDGenerator;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.type.Type;

public class CustomIdGenerator extends UUIDGenerator{
    

    private String entityName;
    
    @Override
    public void configure(Type type, Properties params, ServiceRegistry serviceRegistry) throws MappingException {
        entityName = params.getProperty(ENTITY_NAME);
        super.configure(type, params, serviceRegistry);
    }

    @Override
    public Serializable generate(SessionImplementor session, Object object) {
        Serializable id = session
                .getEntityPersister(entityName, object)
                .getIdentifier(object, session);
        
        String prefix = "";


        if(entityName.contains("BdapBbs")){
        	prefix = "BBS";
        }else if(entityName.contains("BdapFile")){
        	prefix = "FILE";
        }else if(entityName.contains("BdapQna")){
        	prefix = "QNA";
        }else if(entityName.contains("BdapBbsCategory")){
        	prefix = "CATE";
        }else if(entityName.contains("BdapComment")){
        	prefix = "CMT";
        }else if(entityName.contains("BdapCrypto")){
        	prefix = "CRT";
        }else if(entityName.contains("BdapUserAcl")){
        	prefix = "UAL";
        }else if(entityName.contains("BdapUser")){
        	prefix = "USR";
        }else if(entityName.contains("DailyMngTableStat")){
        	prefix = "MNGT";
        }else if(entityName.contains("DailyUsrTableStat")){
        	prefix = "USRT";
        }else if(entityName.contains("BdapCol")){
        	prefix = "COL";
        }else if(entityName.contains("DailyChkTbl")){
        	prefix = "CHK";
        }else if(entityName.contains("DbInfo")){
        	prefix = "DB";
        }else if(entityName.contains("EtcStat")){
        	prefix = "ETC";
        }else if(entityName.contains("NodeStat")){
        	prefix = "NODE";
        }else if(entityName.contains("QryDecHist")){
        	prefix = "QRYD";
        }else if(entityName.contains("QryNorHist")){
        	prefix = "QRYN";
        }else if(entityName.contains("BdapTbl")){
        	prefix = "TBL";
        }else if(entityName.contains("BdapRole")){
        	prefix = "ROLE";
        }else if(entityName.contains("BdapRoleUser")){
        	prefix = "RUSR";
        }else if(entityName.contains("BdapRoleAcl")){
        	prefix = "RACL";
        }else{
        	prefix = entityName.length() > 0 ? entityName.substring(0, 4) : "EMPT";
        }

        if (id == null) {
            id = super.generate(session, object);
            return prefix+id;
        } else {
            return prefix+id;
        }
    }

}
