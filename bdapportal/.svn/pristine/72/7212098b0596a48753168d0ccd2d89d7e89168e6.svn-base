package com.kt.bdapportal.domain;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BdapCryptoColPk implements Serializable {

    private String crtParentId;
    private String crtColNm;
 
    public BdapCryptoColPk(){
    }
 
    @Override
    public boolean equals(Object obj) {
        if(obj instanceof BdapCryptoColPk){
        	BdapCryptoColPk cryptoCol = (BdapCryptoColPk) obj;
 
            if(!cryptoCol.getCrtParentId().equals(crtParentId)){
                return false;
            }
 
            if(!cryptoCol.getCrtColNm().equals(crtColNm)){
                return false;
            }
 
            return true;
        }
 
        return false;
    }

    @Override
    public int hashCode() {
        return crtParentId.hashCode() + crtColNm.hashCode();
    }

	public String getCrtParentId() {
		return crtParentId;
	}

	public void setCrtParentId(String crtParentId) {
		this.crtParentId = crtParentId;
	}

	public String getCrtColNm() {
		return crtColNm;
	}

	public void setCrtColNm(String crtColNm) {
		this.crtColNm = crtColNm;
	}

    
    
}
