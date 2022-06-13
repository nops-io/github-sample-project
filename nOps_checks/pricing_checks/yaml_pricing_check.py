import yaml
from pathlib import Path
from checkov.common.models.enums import CheckCategories, CheckResult
from checkov.yaml_doc.base_yaml_check import BaseYamlCheck
from checkov.yaml_doc.enums import BlockType
from nops_cli.subcommands.pricing.checkov_pricing import CheckovPricing

class CheckPricing(BaseYamlCheck):
    def __init__(self):
        name = "Check nOps Pricing"
        id = "CKV_PRICING_1"
        categories = [CheckCategories.LOGGING]
        super().__init__(
           name=name,
           id=id,
           categories=categories,
           supported_entities=["test"],
           block_type=BlockType.DOCUMENT
        )

    def scan_entity_conf(self, conf):
        pricing = CheckovPricing(conf)
        check = pricing.check_project_cost()
        if check:
            return CheckResult.PASSED, conf
        return CheckResult.FAILED, conf

check = CheckPricing()
