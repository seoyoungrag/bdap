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
import com.kt.bdapportal.domain.BdapRole;
import com.kt.bdapportal.domain.BdapRoleUser;
import com.kt.bdapportal.domain.BdapUser;

public class RoleUserIdsStringToDomain extends JsonDeserializer<BdapRoleUser>{

	@Override
	public BdapRoleUser deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
		ObjectCodec oc = p.getCodec();
	    JsonNode node = oc.readTree(p);
	    BdapRoleUser bru = new BdapRoleUser();
	    BdapRole br = new BdapRole();
	    List<BdapUser> bdapUserList = new ArrayList<BdapUser>();
	    br.setRoleId(node.get("roleId").textValue());
	    bru.setRoleId(br);
	    bru.setBdapUser(bdapUserList);
	    if (node.get("roleUserIds").isArray()) {
	        for (JsonNode user : node.get("roleUserIds")) {
	        	BdapUser bu = new BdapUser();
	        	bu.setUserId(user.asText());
	        	bdapUserList.add(bu);
	        }
	    }
	    return bru;
	}

}

