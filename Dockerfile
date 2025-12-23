# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes were provided in the workflow.
# The following unknown-registry custom nodes did NOT include a GitHub 'aux_id' and therefore could not be auto-resolved or cloned:
# - LTXVConditioning
# - LTXVScheduler
# - Note
# - CheckpointLoaderSimple
# - CLIPLoader
# - SamplerCustom
# - VAEDecode
# - SaveWEBM
# - CLIPTextEncode
# - SaveAnimatedWEBP
# - KSamplerSelect
# - EmptyLTXVLatentVideo
# - CLIPTextEncode

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Lightricks/LTX-Video/resolve/main/ltxv-2b-0.9.8-distilled-fp8.safetensors --relative-path models/checkpoints --filename ltxv-2b-0.9.8-distilled-fp8.safetensors
RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn_scaled.safetensors --relative-path models/clip --filename t5xxl_fp8_e4m3fn_scaled.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
