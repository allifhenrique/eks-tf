
resource "kubernetes_namespace" "urbanfood" {
  metadata {
    annotations = {
      name = "deploy-urbanfood"
    }

    labels = {
      mylabel = "urban-food"
    }

    name = var.namespace
  }
}