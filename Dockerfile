FROM springci/graalvm-ce:dev-java11-0.9.x AS build
#RUN gu install native-image
COPY app.jar /build/
RUN cd build && native-image --static -jar app.jar -H:Name=output

FROM scratch
COPY --from=build /build/output /opt/output
CMD ["/opt/output"]
