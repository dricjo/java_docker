FROM springci/graalvm-ce:dev-java11-0.9.x AS build
#RUN gu install native-image
COPY app.jar /build/
COPY upx-3.96-amd64_linux /build/upx-3.96-amd64_linux
RUN cd build && native-image --static -jar app.jar -H:Name=output
RUN /build/upx-3.96-amd64_linux/upx --best /build/output

FROM scratch
COPY --from=build /build/output /opt/output
CMD ["/opt/output"]
