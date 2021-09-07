import pytest
import json

DRY_RUN_FILE = 'application/plan.json'


@pytest.fixture
def dry_run():
    with open(DRY_RUN_FILE, 'r') as f:
        return json.load(f)


@pytest.fixture
def firewall(dry_run):
    resources = dry_run['planned_values']['root_module']['resources']
    for resource in resources:
        if resource['type'] == 'google_compute_firewall':
            return resource


def test_firewall_source_range_should_not_be_open(firewall):
    source_ranges = firewall['values']['source_ranges']
    assert '0.0.0.0/0' not in source_ranges
