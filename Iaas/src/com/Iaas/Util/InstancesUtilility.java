/**
 * 
 */
package com.Iaas.Util;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.Iaas.dbConnections.DBConnections;
import com.Iaas.dbConnections.DBOperations;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.ec2.AmazonEC2;
import com.amazonaws.services.ec2.AmazonEC2Client;
import com.amazonaws.services.ec2.model.CreateKeyPairRequest;
import com.amazonaws.services.ec2.model.DescribeInstancesRequest;
import com.amazonaws.services.ec2.model.RunInstancesRequest;
import com.amazonaws.services.ec2.model.RunInstancesResult;
import com.amazonaws.services.ec2.model.StartInstancesRequest;
import com.amazonaws.services.ec2.model.StopInstancesRequest;
import com.amazonaws.services.ec2.model.TerminateInstancesRequest;

/**
 * @author Rahul
 *
 */
public class InstancesUtilility {

	private AmazonEC2 initializeConnection() {
		AmazonEC2 amazonEC2Client = new AmazonEC2Client(
				new BasicAWSCredentials(UtilConstants.accessKeyId, UtilConstants.secretAccessKey));
		amazonEC2Client.setEndpoint(UtilConstants.endPoint);
		return amazonEC2Client;
	}

	public String createSensorInstance(String sensorType, String location) throws Exception {
		String status = "running";
		AmazonEC2 amazonEC2Client = initializeConnection();
		/* Creating KeyPairs */
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		String ec2KeyPair = "Ec2InstanceKey" + uuid;
		CreateKeyPairRequest createKeyPairRequest = new CreateKeyPairRequest();
		// Should have unique key name always. Should make it dynamic. Make it
		createKeyPairRequest.withKeyName(ec2KeyPair);
		amazonEC2Client.createKeyPair(createKeyPairRequest);

		/* Creating Amazon EC2 instance. */
		RunInstancesRequest runInstancesRequest = new RunInstancesRequest();
		runInstancesRequest.withImageId(UtilConstants.ec2ImageId).withInstanceType(UtilConstants.ec2InstanceType)
				.withMinCount(1).withMaxCount(1).withKeyName(ec2KeyPair).withSecurityGroups("default");
		RunInstancesResult runInstancesResult = amazonEC2Client.runInstances(runInstancesRequest);

		DescribeInstancesRequest ir = new DescribeInstancesRequest();
		ir.withInstanceIds(runInstancesResult.getReservation().getInstances().get(0).getInstanceId());
		String sensorId = runInstancesResult.getReservation().getInstances().get(0).getInstanceId();

		// Insert Sensor Data into Database
		DBConnections dbConnections = new DBConnections();
		boolean result = dbConnections.checkLocation(location, sensorType);
		if (!result) {
			DBOperations insertSensorData = new DBOperations();
			status = insertSensorData.insertSensorData(sensorType, location);
		}

		// Insert User Sensor Data into Database
		DBOperations insertUserSensorData = new DBOperations();
		insertUserSensorData.insertUserSensorData(sensorId, status, location, sensorType);

		// Configure and map the Sensor to a Hub
		DBOperations dbOperations = new DBOperations();
		String hubName = dbOperations.configureSensortoHub(sensorId, location);
		return hubName;
	}

	public void startSensorInstance(String instanceId) {
		AmazonEC2 ec2 = initializeConnection();
		StartInstancesRequest startRequest = new StartInstancesRequest().withInstanceIds(instanceId);
		ec2.startInstances(startRequest);
	}

	public void stopSensorInstance(String instanceId) {
		AmazonEC2 ec2 = initializeConnection();
		List<String> instancesToStop = new ArrayList<String>();
		instancesToStop.add(instanceId);
		StopInstancesRequest stoptr = new StopInstancesRequest();
		stoptr.setInstanceIds(instancesToStop);
		ec2.stopInstances(stoptr);
	}

	public void terminateSensorInstance(String instanceId) {
		AmazonEC2 ec2 = initializeConnection();
		List<String> instancesToTerminate = new ArrayList<String>();
		instancesToTerminate.add(instanceId);
		TerminateInstancesRequest terminateInstancesRequest = new TerminateInstancesRequest();
		terminateInstancesRequest.setInstanceIds(instancesToTerminate);
		ec2.terminateInstances(terminateInstancesRequest);
	}
}
