// autoscaling.tf
resource "kubernetes_deployment" "cluster_autoscaler" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"
    labels = {
      app = "cluster-autoscaler"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "cluster-autoscaler"
      }
    }

    template {
      metadata {
        labels = {
          app = "cluster-autoscaler"
        }
      }

      spec {
        service_account_name = "cluster-autoscaler"
        container {
          image = "k8s.gcr.io/autoscaling/cluster-autoscaler:v1.21.0"
          name  = "cluster-autoscaler"

          command = [
            "./cluster-autoscaler",
            "--v=2",
            "--stderrthreshold=info",
            "--cloud-provider=aws",
            "--skip-nodes-with-local-storage=false",
            "--nodes=1:4:my-eks-nodegroup"
          ]

          resources {
            limits {
              cpu    = "100m"
              memory = "300Mi"
            }

            requests {
              cpu    = "100m"
              memory = "300Mi"
            }
          }
        }
      }
    }
  }
}
