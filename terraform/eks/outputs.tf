output "cluster_name" {
  value = aws_eks_cluster.tier4.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.tier4.endpoint
}

output "node_group_name" {
  value = aws_eks_node_group.tier4_nodes.node_group_name
}
