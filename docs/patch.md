# patch

## aodh

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.aodh.host_fqdn_override.public=aodh.${OSH_FQDN}
```

## barbican

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.barbican.key_manager.host_fqdn_override.public=barbican.${OSH_FQDN}
```

## ceilometer

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.ceilometer.metering.host_fqdn_override.public=ceilometer.${OSH_FQDN} \
--set endpoints.ceilometer.metric.host_fqdn_override.public=gnochi.${OSH_FQDN} \
--set endpoints.ceilometer.alarming.host_fqdn_override.public=aodh.${OSH_FQDN}
```

## cyborg

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.cyborg.accelerator.host_fqdn_override.public=cyborg.${OSH_FQDN}
```

## designate

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.designate.dns.host_fqdn_override.public=designate.${OSH_FQDN} \
--set endpoints.designate.mdns.host_fqdn_override.public=designate-mdns.${OSH_FQDN} \
--set endpoints.designate.powerdns.host_fqdn_override.public=powerdns.${OSH_FQDN}
```

## glance

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.glance.image.host_fqdn_override.public=glance.${OSH_FQDN} \
--set endpoints.glance.object_store.host_fqdn_override.public=radosgw.${OSH_FQDN} \
--set endpoints.glance.ceph_object_store.host_fqdn_override.public=radosgw.${OSH_FQDN} \
--set endpoints.glance.dashboard.host_fqdn_override.public=horizon.${OSH_FQDN}
```

## heat

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.heat.orchestration.host_fqdn_override.public=heat.${OSH_FQDN} \
--set endpoints.heat.cloudformation.host_fqdn_override.public=cloudformation.${OSH_FQDN} \
--set endpoints.heat.cloudwatch.host_fqdn_override.public=cloudwatch.${OSH_FQDN}
```

## horizon

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.horizon.dashboard.host_fqdn_override.public=horizon.${OSH_FQDN}
```

## ironic

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.ironic.baremetal.host_fqdn_override.public=ironic.${OSH_FQDN} \
--set endpoints.ironic.image.host_fqdn_override.public=glance.${OSH_FQDN} \
--set endpoints.ironic.network.host_fqdn_override.public=neutron.${OSH_FQDN} \
--set endpoints.ironic.object_store.host_fqdn_override.public=radosgw.${OSH_FQDN}
```

## keystone

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN}
```

## magnum

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.magnum.container_infra.host_fqdn_override.public=magnum.${OSH_FQDN} \
--set endpoints.magnum.key_manager.host_fqdn_override.public=barbican.${OSH_FQDN} \
--set endpoints.magnum.orchestration.host_fqdn_override.public=heat.${OSH_FQDN}
```

## masaraki

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.masaraki.instance_ha.host_fqdn_override.public=masaraki.${OSH_FQDN}
```

## mistral

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.mistral.worflowv2.host_fqdn_override.public=mistral.${OSH_FQDN}
```

## neutron

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.neutron.compute.host_fqdn_override.public=nova.${OSH_FQDN} \
--set endpoints.neutron.compute_metadata.host_fqdn_override.public=metadata.${OSH_FQDN} \
--set endpoints.neutron.network.host_fqdn_override.public=neutron.${OSH_FQDN} \
--set endpoints.neutron.loadbalancer.host_fqdn_override.public=octavia.${OSH_FQDN} \
--set endpoints.neutron.dns.host_fqdn_override.public=designate.${OSH_FQDN} \
--set endpoints.neutron.baremetal.host_fqdn_override.public=ironic.${OSH_FQDN}
```

## nova

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.nova.image.host_fqdn_override.public=glance.${OSH_FQDN} \
--set endpoints.nova.compute.host_fqdn_override.public=nova.${OSH_FQDN} \
--set endpoints.nova.compute_metadata.host_fqdn_override.public=metadata.${OSH_FQDN} \
--set endpoints.nova.compute_novnc_proxy.host_fqdn_override.public=novncproxy.${OSH_FQDN} \
--set endpoints.nova.compute_spice_proxy.host_fqdn_override.public=placement.${OSH_FQDN} \
--set endpoints.nova.placement.host_fqdn_override.public=placement.${OSH_FQDN} \
--set endpoints.nova.network.host_fqdn_override.public=neutron.${OSH_FQDN} \
--set endpoints.nova.baremetal.host_fqdn_override.public=ironic.${OSH_FQDN}
```

## octavia

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.octavia.loadbalancer.host_fqdn_override.public=octavia.${OSH_FQDN} \
--set endpoints.octavia.network.host_fqdn_override.public=neutron.${OSH_FQDN}
```

## placement

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.placement.placement.host_fqdn_override.public=placement.${OSH_FQDN}
```

## rally

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.rally.benchmark.host_fqdn_override.public=rally.${OSH_FQDN}
```

## senlin

```bash
--set endpoints.identity.host_fqdn_override.public=keystone.${OSH_FQDN} \
--set endpoints.senlin.clustering.host_fqdn_override.public=senlin.${OSH_FQDN}
```
