from nops_sdk.graphql import GraphQL
from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.yaml_doc.base_yaml_check import BaseYamlCheck
from checkov.yaml_doc.enums import BlockType

class CheckEncryptedVolumes(BaseYamlCheck):
    def __init__(self):
        name = "Check if ec2 instance volumes are encrypted"
        id = "CKV_ENCRYPTED_VOLUMES_1"
        categories = [CheckCategories.LOGGING]
        super().__init__(
           name=name,
           id=id,
           categories=categories,
           supported_entities=["test"],
           block_type=BlockType.DOCUMENT
        )

    def scan_entity_conf(self, conf):
        query = "query MyQuery { ec2_volumes { encrypted volume_id }}"
        graphql = GraphQL(query=query)
        result = graphql.get_query_result()

        un_encrypted_volumes = []
        ec2_volumes = result.get("ec2_volumes")
        for ec2_volume in ec2_volumes:
        	if not ec2_volume.get("encrypted"):
        		volume_id = ec2_volume.get("volume_id")
        		un_encrypted_volumes.append(volume_id)
        if not un_encrypted_volumes:
        	return CheckResult.PASSED, conf
        else:
        	print(f"Volumes with Ids {un_encrypted_volumes} are not encrypted")
        	return CheckResult.FAILED, conf

check = CheckEncryptedVolumes()

