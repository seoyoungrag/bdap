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
import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleAcl;

public class RoleAclIdsStringToDomain extends JsonDeserializer<BdapRoleAcl>{

	@Override
	public BdapRoleAcl deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
		ObjectCodec oc = p.getCodec();
	    JsonNode node = oc.readTree(p);
	    BdapRoleAcl bra = new BdapRoleAcl();
	    BdapRole br = new BdapRole();
	    List<BdapAcl> bdapAclList = new ArrayList<BdapAcl>();
	    br.setRoleId(node.get("roleId").textValue());
	    bra.setRoleId(br);
	    bra.setBdapAcl(bdapAclList);
	    if (node.get("roleAclIds").isArray()) {
	        for (JsonNode acl : node.get("roleAclIds")) {
	        	BdapAcl ba = new BdapAcl();
	        	ba.setAclId(acl.asText());
	        	bdapAclList.add(ba);
	        }
	    }
	    return bra;
	}

}

