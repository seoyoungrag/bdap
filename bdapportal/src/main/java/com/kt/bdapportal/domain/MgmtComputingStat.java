package com.kt.bdapportal.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="MGMT_COMPUTING_STAT")
public class MgmtComputingStat {

	@Id
	@GeneratedValue(generator = "inquisitive-uuid")
	@GenericGenerator(name = "inquisitive-uuid", strategy = "com.kt.bdapportal.common.util.CustomIdGenerator")
	@Column(name="COMPUTING_STAT_ID")
	public String id;
	
	//The number of applications submitted
	@Column(name="APPS_SUBMITTED")
	int appsSubmitted;
	
	//The number of applications completed
	@Column(name="APPS_COMPLETED")
	int appsCompleted;
	
	//The number of applications pending
	@Column(name="APPS_PENDING")
	int appsPending;
	
	//The number of applications running
	@Column(name="APPS_RUNNING")
	int appsRunning;
	
	//The number of applications failed
	@Column(name="APPS_FAILED")
	int	 appsFailed;
	
	//The number of applications killed
	@Column(name="APPS_KILLED")
	int	 appsKilled;
	
	//The amount of memory reserved in MB
	@Column(name="RESERVED_MB")
	long reservedMB;		
	
	//The amount of memory available in MB
	@Column(name="AVAILABLE_MB")
	long availableMB;
	
	//The amount of memory allocated in MB
	@Column(name="ALLOCATED_MB")
	long allocatedMB;
	
	//The amount of total memory in MB
	@Column(name="TOTAL_MB")
	long totalMB;		
	
	//The number of reserved virtual cores
	@Column(name="RESERVED_VIRTUAL_CORES")
	long reservedVirtualCores;	
	
	//The number of available virtual cores
	@Column(name="AVAILABLE_VIRTUAL_CORES")
	long availableVirtualCores;
	
	//The number of allocated virtual cores
	@Column(name="ALLOCATED_VIRTUAL_CORES")
	long allocatedVirtualCores;
	
	//The total number of virtual cores
	@Column(name="TOTAL_VIRTUAL_CORES")
	long totalVirtualCores;	
	
	//The number of containers allocated
	@Column(name="CONTAINERS_ALLOCATED")
	int containersAllocated;
	
	//The number of containers reserved
	@Column(name="CONTAINERS_RESERVED")
	int containersReserved;	
	
	//The number of containers pending
	@Column(name="CONTAINERS_PENDING")
	int containersPending;
	
	//The total number of nodes
	@Column(name="TOTAL_NODES")
	int	 totalNodes;	
	
	//	The number of active nodes
	@Column(name="ACTIVE_NODES")
	int activeNodes;
	
	//The number of lost nodes
	@Column(name="LOST_NODES")
	int	 lostNodes;	
	
	//The number of unhealthy nodes
	@Column(name="UNHEALTY_NODES")
	int unhealthyNodes;
	
	//The number of nodes decommissioned
	@Column(name="DECOMMISSIONED_NODES")
	int decommissionedNodes;	
	
	//The number of nodes rebooted
	@Column(name="REBOOTED_NODES")
	int rebootedNodes;

	@Column(name="STAT_CREATE_DT", updatable=false, insertable=false)
	@Temporal(TemporalType.TIMESTAMP)
	public Date statCreateDt;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAppsSubmitted() {
		return appsSubmitted;
	}
	public void setAppsSubmitted(int appsSubmitted) {
		this.appsSubmitted = appsSubmitted;
	}
	public int getAppsCompleted() {
		return appsCompleted;
	}
	public void setAppsCompleted(int appsCompleted) {
		this.appsCompleted = appsCompleted;
	}
	public int getAppsPending() {
		return appsPending;
	}
	public void setAppsPending(int appsPending) {
		this.appsPending = appsPending;
	}
	public int getAppsRunning() {
		return appsRunning;
	}
	public void setAppsRunning(int appsRunning) {
		this.appsRunning = appsRunning;
	}
	public int getAppsFailed() {
		return appsFailed;
	}
	public void setAppsFailed(int appsFailed) {
		this.appsFailed = appsFailed;
	}
	public int getAppsKilled() {
		return appsKilled;
	}
	public void setAppsKilled(int appsKilled) {
		this.appsKilled = appsKilled;
	}
	public long getReservedMB() {
		return reservedMB;
	}
	public void setReservedMB(long reservedMB) {
		this.reservedMB = reservedMB;
	}
	public long getAvailableMB() {
		return availableMB;
	}
	public void setAvailableMB(long availableMB) {
		this.availableMB = availableMB;
	}
	public long getAllocatedMB() {
		return allocatedMB;
	}
	public void setAllocatedMB(long allocatedMB) {
		this.allocatedMB = allocatedMB;
	}
	public long getTotalMB() {
		return totalMB;
	}
	public void setTotalMB(long totalMB) {
		this.totalMB = totalMB;
	}
	public long getReservedVirtualCores() {
		return reservedVirtualCores;
	}
	public void setReservedVirtualCores(long reservedVirtualCores) {
		this.reservedVirtualCores = reservedVirtualCores;
	}
	public long getAvailableVirtualCores() {
		return availableVirtualCores;
	}
	public void setAvailableVirtualCores(long availableVirtualCores) {
		this.availableVirtualCores = availableVirtualCores;
	}
	public long getAllocatedVirtualCores() {
		return allocatedVirtualCores;
	}
	public void setAllocatedVirtualCores(long allocatedVirtualCores) {
		this.allocatedVirtualCores = allocatedVirtualCores;
	}
	public long getTotalVirtualCores() {
		return totalVirtualCores;
	}
	public void setTotalVirtualCores(long totalVirtualCores) {
		this.totalVirtualCores = totalVirtualCores;
	}
	public int getContainersAllocated() {
		return containersAllocated;
	}
	public void setContainersAllocated(int containersAllocated) {
		this.containersAllocated = containersAllocated;
	}
	public int getContainersReserved() {
		return containersReserved;
	}
	public void setContainersReserved(int containersReserved) {
		this.containersReserved = containersReserved;
	}
	public int getContainersPending() {
		return containersPending;
	}
	public void setContainersPending(int containersPending) {
		this.containersPending = containersPending;
	}
	public int getTotalNodes() {
		return totalNodes;
	}
	public void setTotalNodes(int totalNodes) {
		this.totalNodes = totalNodes;
	}
	public int getActiveNodes() {
		return activeNodes;
	}
	public void setActiveNodes(int activeNodes) {
		this.activeNodes = activeNodes;
	}
	public int getLostNodes() {
		return lostNodes;
	}
	public void setLostNodes(int lostNodes) {
		this.lostNodes = lostNodes;
	}
	public int getUnhealthyNodes() {
		return unhealthyNodes;
	}
	public void setUnhealthyNodes(int unhealthyNodes) {
		this.unhealthyNodes = unhealthyNodes;
	}
	public int getDecommissionedNodes() {
		return decommissionedNodes;
	}
	public void setDecommissionedNodes(int decommissionedNodes) {
		this.decommissionedNodes = decommissionedNodes;
	}
	public int getRebootedNodes() {
		return rebootedNodes;
	}
	public void setRebootedNodes(int rebootedNodes) {
		this.rebootedNodes = rebootedNodes;
	}
	
	public Date getStatCreateDt() {
		return statCreateDt;
	}
	public void setStatCreateDt(Date statCreateDt) {
		this.statCreateDt = statCreateDt;
	}
	public MgmtComputingStat() {
		super();
	}
	public MgmtComputingStat(String id, int appsSubmitted, int appsCompleted, int appsPending, int appsRunning,
			int appsFailed, int appsKilled, long reservedMB, long availableMB, long allocatedMB, long totalMB,
			long reservedVirtualCores, long availableVirtualCores, long allocatedVirtualCores, long totalVirtualCores,
			int containersAllocated, int containersReserved, int containersPending, int totalNodes, int activeNodes,
			int lostNodes, int unhealthyNodes, int decommissionedNodes, int rebootedNodes, Date statCreateDt) {
		super();
		this.id = id;
		this.appsSubmitted = appsSubmitted;
		this.appsCompleted = appsCompleted;
		this.appsPending = appsPending;
		this.appsRunning = appsRunning;
		this.appsFailed = appsFailed;
		this.appsKilled = appsKilled;
		this.reservedMB = reservedMB;
		this.availableMB = availableMB;
		this.allocatedMB = allocatedMB;
		this.totalMB = totalMB;
		this.reservedVirtualCores = reservedVirtualCores;
		this.availableVirtualCores = availableVirtualCores;
		this.allocatedVirtualCores = allocatedVirtualCores;
		this.totalVirtualCores = totalVirtualCores;
		this.containersAllocated = containersAllocated;
		this.containersReserved = containersReserved;
		this.containersPending = containersPending;
		this.totalNodes = totalNodes;
		this.activeNodes = activeNodes;
		this.lostNodes = lostNodes;
		this.unhealthyNodes = unhealthyNodes;
		this.decommissionedNodes = decommissionedNodes;
		this.rebootedNodes = rebootedNodes;
		this.statCreateDt = statCreateDt;
	}
}
