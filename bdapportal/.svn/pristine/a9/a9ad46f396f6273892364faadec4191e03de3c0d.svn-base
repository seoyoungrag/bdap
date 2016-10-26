package com.kt.bdapportal.common.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import com.kt.bdapportal.domain.BdapAcl;
import com.kt.bdapportal.domain.BdapUser;
import com.kt.bdapportal.domain.BdapUserAcl;

public class UserAclIdsStringToDomain extends JsonDeserializer<BdapUserAcl>{

	@Override
	public BdapUserAcl deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
		ObjectCodec oc = p.getCodec();
	    JsonNode node = oc.readTree(p);
    	BdapUserAcl bau = new BdapUserAcl();
    	BdapUser bu = new BdapUser();
    	List<BdapAcl> bdapAclList = new ArrayList<BdapAcl>();
    	bu.setUserId(node.get("userId").textValue());
    	bau.setUserId(bu);
    	bau.setBdapAcl(bdapAclList);
	    if (node.get("userAclIds").isArray()) {
	        for (JsonNode acl : node.get("userAclIds")) {
	        	BdapAcl ba = new BdapAcl();
	        	ba.setAclId(acl.asText());
	        	bdapAclList.add(ba);
	        }
        	
	    }
	    return bau;
	}

}
